


To track a download:

Add the file, location and project to the files table in analytics database.
INSERT INTO files(file_name, file_location, project_name) VALUES("file.zip", "https://www.timbeaudet.com/builds/", "Project Name");

Use a link that goes through download.php and supplies the filename added above:
https://www.tyrebytes.com/download.php?file=FILE_NAME.ZIP



Event Names and Descriptions:

Download: OS file.
First Launch (OS)
Launched

Completed Level: Level Name
Completed Game: Ending X



More Noisy Items for HIGHLY desired projects:
NOTE: This will need a better API than hitting the server for each request.
	The client should somehow track events and send in bulk; How to handle timing? Does timing matter?

	If timing is NOT important here we could just dump the information into table and use the time of server when it synced.
	If timing IS important, we should have the client/game include current time/date in the event upload process.
		The server could then get the difference in the time, and adjust all times appropriately as it inserts into TABLE.

SceneName_YYY
PlayerDeath: At Location
LapTime: Track/Car
