# Manually Restarting Gitea:
```
ssh webhost.com
su - username
./gitea_1.40 &
```

> The `&` at the end of the last command moves it to the background. If it went missing, use the following put the process in the background.

```
CTRL-Z
bg
```
