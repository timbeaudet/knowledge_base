# Today is 2019-11-16

## Objectives for the day:

- Refactor StreamHelper for the receiving of commands through the TidalBuoy protocol.
  - Requires processing the user data that was sent through TidalBuoy [done 2019-11-15]
  - Requires handling responses, global or whisper (TidalBuoy needs to send data back to TurtleBot)
- Moving StreamHelper Twitch connection into TurtleBot, removing Twitch connection from StreamHelper
  - Requires a lot of TidalBuoy communications to make all the features work again.
  - Requires moving the secret files and ensuring the connection is working as expected (receiving messages)
- Stretch: Move the Twitch Services API from StreamHelper into TurtleBot (this is used to collect current followers and subscribers)
  - Stretch: During the move this will get cleaned up from running a seperate thread to using Async HTTP requests.
- Move the other modules from StreamHelper into TurtleBot and rely on TidalBuoy for communications.

# Purpose

- Continue the master plan of centralizing the Twitch chat bot so it can run on 'hippo'
- Make it so that StreamHelper is simply an overlay application that communicates with TurtleBot.
