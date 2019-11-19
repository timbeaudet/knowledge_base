# Today is 2019-11-19

## Objectives for the day:

- Add an optional 'default' service to ModuleManager so global messages will get sent
  - This is sort of a hack/work-around for Perch game and other non command responses in StreamHelper.
- Moving the WebAPI module over to TurtleBot as a Service and passing the commands through TidalBuoy.

# Purpose

- Continue the master plan of centralizing the Twitch chat bot so it can run on 'hippo'
- Make it so that StreamHelper is simply an overlay application that communicates with TurtleBot.
