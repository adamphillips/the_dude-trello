# TheDude-Trello

Adds basic Trello integration to [TheDude](https://github.com/adamphillips/the_dude).

### Installing

Install the gem using

```shell
$ gem install the_dude-trello
```

The dude should detect the plugin and initialize it automatically. In order to check that the plugin is installed you can type

```shell
$ dude list plugins
```

You then need to set your Trello authentication details. To do this, create a
folder in your home directory called .duderc (if you haven't already got one).
Since this is simply a thin wrapper for the
[ruby-trello](https://github.com/jeremytregunna/ruby-trello) gem, you can
configure the plugin using any of the [supported
methods](https://github.com/jeremytregunna/ruby-trello#configuration). Just add
the required code to your .duderc file.
