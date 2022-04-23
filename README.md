# Heroku Godot Server buildpack

A simple Heroku buildpack to deploy and host Godot Websocket Server
The 'keepalive' mechanism should be handled from within the Godot server build
by pinging google or something else.


## Features:
- Deploy Godot Websocket server code to heroku.
- Host your deployed build. 

## ENV vars:
- PORT - port that the Godot websocket server listens on
