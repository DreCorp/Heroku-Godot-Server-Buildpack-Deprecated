# Heroku Godot Server buildpack

[Heroku](https://heroku.com) [buildpack](https://devcenter.heroku.com/articles/buildpacks) for continuos deployment of [Godot](https://godotengine.org) projects utilizing [WebSocketServer](https://docs.godotengine.org/en/stable/classes/class_websocketserver.html#class-websocketserver).

## Resources used :
- [Abdera7mane/godot-server-buildpack](https://github.com/Abdera7mane/godot-server-buildpack)
- [3ddelano/heroku-buildpack-godot](https://github.com/3ddelano/heroku-buildpack-godot)
- [ethiandev/heroku-buildpack-godot](https://github.com/lethiandev/heroku-buildpack-godot)

## Features:
- Deploy Godot project exports from source to Heroku.
- Run with [Godot server executable](https://godotengine.org/download/server).
## Required Heroku config vars:
- GODOT_VERSION
- PORT

## Required Godot export template:
- [Linux/X11](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_linux.html?highlight=export%20template)
