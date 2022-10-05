# Start LudumDare Ratings GameJam Stream

1. SSH to webhost timbeaudet.com
2. `mv gamejamgames.db gamejamgames_ldXY.db` for backing up the old database.
3. `cp gamejamgames_empty.db gamejamgames.db` to clear out the database and start fresh.
4. in timbeaudet.com/streams/gamejam vim BOTH index.php and queue.php to modify  `$eventNumber = XY`
5. Use [theboss](https://timbeaudet.com/streams/gamejam/theboss.php) page for administration details.
6. Run the gamejam bot found in private/gamejam/ with `php main.php`, probably in a screen.

## To continue running the game:

- Click gamepad icon in admin panel when starting the game.
- Click VIP for those that VIPs
- Click "done" when done playing game.


Don't mess anything up, pls.
