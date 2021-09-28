# Basics of PHP

//Must manually print booleans as a string, otherwise they don't print anything...
//error_log("User is already subscribed: " . ($is_already_subscribed ? "true" : "false"));

Use print_r(object, true) to return the contents of an object as a string.

Start a local php server for testing by navigating to the website root on hippo and running
```
php -S 0.0.0.0:5550
```
Then you can access it on falcon web-browser with `http://hippo:5550/path`
