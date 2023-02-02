# **Heroku Godot Server buildpack - DEPRECATED**

## :no_entry_sign: This repo is no longer maintained or supported! :no_entry_sign:

[![Maintenance](https://img.shields.io/badge/Maintained%3F-no-red.svg)](https://bitbucket.org/lbesson/ansi-colors)
#

[Heroku](https://heroku.com) [buildpack](https://devcenter.heroku.com/articles/buildpacks) for continuous deployment of [Godot](https://godotengine.org) projects utilizing [WebSocketServer](https://docs.godotengine.org/en/stable/classes/class_websocketserver.html#class-websocketserver).

---
## Features:
- [Automatic deploys](https://devcenter.heroku.com/articles/github-integration#automatic-deploys) of Godot projects from source to [Heroku with git](https://devcenter.heroku.com/articles/git).
- Run with [Godot server executable](https://godotengine.org/download/server).


---
## Required Heroku config vars:
- **GODOT_VERSION** such as **3.4.4**
---
## Required Godot export template:
- Exported project will be built with [Linux/X11 template](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_linux.html?highlight=export%20template).
---
## Handling of **$PORT** :

- Heroku randomly assigns the port for the application.
- Exported project needs to bind to **$PORT** passed as a first argument of [OS.get_cmd_line_args()](https://docs.godotengine.org/en/stable/classes/class_os.html?highlight=OS#class-os-method-get-cmdline-args):

    ~~~scala
    var _args = OS.get_cmd_line_args()
    var _port = _args[0]

    _server.listen(_port)
    ~~~
- Connect **websocket** clients with **wss://your_app.herokuapp.com**
---
## Handling of Heroku **config vars**:
- Heroku [**config vars**](https://devcenter.heroku.com/articles/config-vars) can be consumed by Godot with:
~~~scala
var my_config_var = OS.get_environment('MY_CONFIG_VAR')
~~~

---
## Resources used :
- [Abdera7mane/godot-server-buildpack](https://github.com/Abdera7mane/godot-server-buildpack)
- [3ddelano/heroku-buildpack-godot](https://github.com/3ddelano/heroku-buildpack-godot)
- [ethiandev/heroku-buildpack-godot](https://github.com/lethiandev/heroku-buildpack-godot)


