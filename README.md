# lita-mac_spotify_control

[![Build Status](https://travis-ci.org/madebymade/lita-mac_spotify_control.svg?branch=master)](https://travis-ci.org/madebymade/lita-mac_spotify_control)
[![Code Climate](https://codeclimate.com/github/madebymade/lita-mac_spotify_control/badges/gpa.svg)](https://codeclimate.com/github/madebymade/lita-mac_spotify_control)
[![Test Coverage](https://codeclimate.com/github/madebymade/lita-mac_spotify_control/badges/coverage.svg)](https://codeclimate.com/github/madebymade/lita-mac_spotify_control)

In the [Made](http://www.madetech.co.uk?ref=github&repo=lita-mac_spotify_control) office we have an iMac acting as a Spotify jukebox, which until now was controlled by Hubot. However we predominantly code using Ruby so a switch to Lita was a logical switch.

## Installation

Your Lita instance **must** be on the same machine as an active Spotify session. i.e the app is open.

Add `lita-mac_spotify_control` to your Lita instance's Gemfile:

``` ruby
gem "lita-mac_spotify_control"
```

To make full use of the the handlers functionality you will need to register an [Application with Spotify](https://developer.spotify.com/my-applications) this allows RSpotify to search playlists and get track details.

At time of writing (20/04/2015) their is a known bug in Spotify's Applescript implementation. There is [a way around this](https://community.spotify.com/t5/Help-Desktop-Linux-Mac-and/Apple-scripting-broken-in-1-0-1-988-g8f17a348/td-p/1029434), but at the moment you still can't play tracks from Spotify URIs

## Configuration

TODO: Describe any configuration attributes the plugin exposes.

## Usage

### Commands

| Text                 | Result                                   |
| -------------------- | ---------------------------------------- |
| current track        | Info about the current track             |
| next                 | Play next track                          |
| pause                | Pause Spotify                            |
| play                 | Plays spotify                            |
| play QUERY           | Plays the result of supplied QUERY       |
| play SPOTIFY_URI     | Plays supplied Spotify URI               |
| play SPOTIFY_URL     | Plays playlist from supplied Spotify URL |
| previous/prev        | Play previous track                      |
| repeat               | Toggle repeat on/off                     |
| shuffle              | Toggle shuffling on/off                  |
| volume               | Current volume                           |
| volume up/down/1-10  | Set/change volume                        |

##Credits

Developed and maintained by [Made](http://www.madetech.co.uk?ref=github&repo=lita-mac_spotify_control).

[![made](https://s3-eu-west-1.amazonaws.com/made-assets/googleapps/google-apps.png)](http://www.madetech.co.uk?ref=github&repo=lita-mac_spotify_control)

The Calling of AppleScript from inside ruby was gained from using [this snippet](http://porkrind.org/missives/calling-applescript-from-ruby/)

Many of the AppleScript Spotify commands where inspired by [SpotifyControl](https://github.com/dronir/SpotifyControl)

Key contributions:

* [Seb Ashton](https://github.com/sebashton)

##License

Licensed under [New BSD License](https://github.com/madebymade/lita-mac_spotify_control/blob/master/BSD-LICENSE.md)
