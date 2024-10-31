
When rhino restarts the Display Mangager and NoMachine "argue" with each other since there is no monitor attached. This could be fixed by entirely disabling the display manager with the following, however that would not allow you to connect a monitor in the future??

```
systemctl disable gdm
```

gdm being the default Ubuntu display manager (what display-manager aliases to?)

To fix each time rhino restarts and attempting to connect NoMachine use the following:

```
sudo systemctl stop display-manager
sudo /etc/NX/nxserver --restart
```
