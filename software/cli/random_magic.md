# Random Magic Commands

## YouTube Download all Twitch Clips in a Text File

Note: Only works when there is nothing else but a single clip URL on a line, whitespace is fine.

`grep clips.twitch.tv file.txt | xargs -I{} youtube-dl {}`

## 
