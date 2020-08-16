# How to Build a Custom Engine

Carefully.

No really, there are a few traps that are _super_ easy to get stuck in. The first question you should have a answer to is **"Why do you want to build an engine?"** It could be for learning, personalize work-flow, optimized for your needs, or whatever; but I suspect the higher level answer to this is **"I want to make a game with my engine."**

### Warning:
> Do not fall in the trap of making an engine and _then_ making the game. Make games alongside the engine at all times, only add features to the engine as you have direct need while making a game.

### Another Warning:
> Building an engine will take a lot of additional time. I've been working on TurtleBrains on and off for more than 7 years. There are faster, and easier, ways to create a game.

### Yet Another Warning:
> This is a generalized document that does not know your skill levels, strengths, weaknesses or goals. There are 

## Books

- **OpenGL Superbible** by Graham Sellers, Richard S Wright Jr., and Nicholas Haemel _(Latest/7th Edition covers 4.5, OpenGL is on 4.6)_
- **Real-Time Collision Detection** by Christer Ericson
- **Game Programming Patterns** by Robert Nystrom [free on website.](https://gameprogrammingpatterns.com/)

## Resources

- [Basics of OpenGL](https://open.gl/)
- [OpenGL Documentation](https://docs.gl)
- [Beginning Game Programming with SDL](https://lazyfoo.net/tutorials/SDL/)

## Additional Notes

With TurtleBrains I wrote the low-level code to handle Window Management and platform specifics using the operating system API's as I had a goal to provide higher level functionality than I saw with SDL while not requiring other dependencies. If I was to restart TurtleBrains today without those sames goals I would be using SDL2 or something to avoid dealing with platform specifics.

You really don't need to handle Window Management and platform level code, SDL, SFML and GLFW among others will handle this headache already. Maintaining the platform management code is not a creative endeavor and can be tough to get all the properties setup as expected on each platform, especially when targeting multiple.
