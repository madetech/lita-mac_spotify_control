# lita-mac_spotify_control

In the [Made](http://www.madetech.co.uk?ref=github&repo=lita-mac_spotify_control) office we have an iMac acting as a Spotify jukebox, which until now was controlled by Hubot. However we prodominantly code using Ruby so a switch to Lita was a logical switch.

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

TODO: Describe the plugin's features and how to use them.

##Credits

Developed and maintained by [Made](http://www.madetech.co.uk?ref=github&repo=lita-mac_spotify_control).

[![made](https://s3-eu-west-1.amazonaws.com/made-assets/googleapps/google-apps.png)](http://www.madetech.co.uk?ref=github&repo=navobile)

The Calling of AppleScript from inside ruby was gained from using [this snippet](http://porkrind.org/missives/calling-applescript-from-ruby/)

Many of the AppleScript Spotify commands where inspired by [SpotifyControl](https://github.com/dronir/SpotifyControl)

Key contributions:

* [Seb Ashton](https://github.com/sebashton)

##License

Licensed under [New BSD License](https://github.com/madebymade/lita-mac_spotify_control/blob/master/BSD-LICENSE.md)
