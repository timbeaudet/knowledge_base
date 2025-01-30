
# Issues Dealing with Contact Reports in Bullet

During development of Turbo Boom! I was using Bullet for physics to speed the process of development, and it was the first game where I need reports on the collisions events between two bodies. This is how the explosive barrels know when to explode, or the cannon balls determine when to turn gravity on and begin to fall. Through-out development there were many issues and "false" reports coming from Bullet that seemed believeable enough in the event of the barrels. When adding cannon balls the previous hacks/work-arounds could not apply.

The root cause of the issue is with the code I found that collects the collisions during `stepSimulation()` in order to report them back to game code. This is provided by a callback function you write and set with `setInternalTickCallback()` on the Bullet World object. I kept track of all the collision per step in a container that processed the reports after the simulation to ensure safe removal of physics bodies should that be desired by game logic.

```
//Initialization
bulletWorld->setInternalTickCallback(MyPhysicsStepCallback);

//Per-Frame / Simulate Step
mCollisionReports.clear();
bulletWorld->stepSimulation(Physics::kFixedTime, 1, Physics::kFixedTime);
for (auto report : mCollisionReports)
{
	//Send report to game code for handling the collision between bodies.
}
```

The code above remains unchanged and works well enough. The problems however begin in the implementation of `MyPhysicsStepCallback()`. The original solution to this was found via [a gamedev.stackexchange.com post](https://gamedev.stackexchange.com/questions/22442/how-get-collision-callback-of-two-specific-objects-using-bullet-physics) where I guess in transfering the code, or along the process of adding other bits I wound up not keeping something super critical.

```cpp
void MyPhysicsStepCallback(btDynamicsWorld* dynamicsWorld, btScalar timeStep)
{
	Container* collisionReports = reinterpret_cast<Container*>(dynamicsWorld->getWorldUserInfo());

	const int numManifolds = dynamicsWorld->getDispatcher()->getNumManifolds();
	for (int i = 0; i < numManifolds; i++)
	{
		const btPersistentManifold* contactManifold = dynamicsWorld->getDispatcher()->getManifoldByIndexInternal(i);

		//Note: for your own game logic you can use getUserPointer() which returns
		//whatever was added via bulletBody->setUserPointer();
		const btCollisionObject* object0 = contactManifold->getBody0();
		const btCollisionObject* object1 = contactManifold->getBody1();

		//This is a very simple report that just shares the two objects that collided.
		CollisionReport report{ object0, object1 };
		collisionReports->push_back(report);
	}
}
```

On the surface this all looks fairly fine, my original code was a little more involved since I was storing and grabbing my own entity types, and error checking. I also had some special case logic for the RacecarEntity, but none of that matters for this specific issue and was removed for clarity.

It also seemed to work, mostly. Barrels had an issue on reset, which was not tracked down far enough to reveal this being the reason; despite several days of effort being spent on that issue. A different hack was used to ensure barrels didn't explode at reset that was mostly working. Until cannon balls were added where that hack no longer applied and trying to cancel gravity until a ball hit an object was not trivial. In fact it behaved extremely odd and appeared that "run A" would affect "run B" after a physics reset. It was like collisions persisted through the reset.

In several hours of effort debugging this on stream with help from viewers, Jabokoe found the root cause was `MyPhysicsStepCallback()` pushing all contact manifolds into the report container. A contact manifold does NOT mean two bodies are ACTUALLY intersecting, it could be a broadphase intersection instead; TL;DR broadphase is a way to sort of cull out collisions that would never happen or ones that may be possible before running more expensive intersection tests.

The following is the **good** code that works for `MyPhysicsStepCallback()`.

```cpp
void MyPhysicsStepCallback(btDynamicsWorld* dynamicsWorld, btScalar timeStep)
{
	Container* collisionReports = reinterpret_cast<Container*>(dynamicsWorld->getWorldUserInfo());

	const int numManifolds = dynamicsWorld->getDispatcher()->getNumManifolds();
	for (int i = 0; i < numManifolds; i++)
	{
		bool skipReport = true;
		const btPersistentManifold* contactManifold = dynamicsWorld->getDispatcher()->getManifoldByIndexInternal(i);

		//Note: for your own game logic you can use getUserPointer() which returns
		//whatever was added via bulletBody->setUserPointer();
		const btCollisionObject* object0 = contactManifold->getBody0();
		const btCollisionObject* object1 = contactManifold->getBody1();

		//Ensure at least ONE contact point is either intersecting or touching by checking distance.
		//This will filter out manifolds contacting only on the broadphase level.
		for (int p = 0; p < contactManifold->getNumContacts(); ++p)
		{
			const btManifoldPoint& pt = contactManifold->getContactPoint(p);
			if (pt.getDistance() <= 0.0f)
			{
				skipReport = false;
			}
		}

		//This is a very simple report that just shares the two objects that collided.
		CollisionReport report{ object0, object1 };
		collisionReports->push_back(report);
	}
}
```
