# lita-mac_spotify_control

In the [Made](http://www.madetech.co.uk?ref=github&repo=lita-mac_spotify_control) office we have an iMac acting as a Spotify jukebox, which until now was controlled by Hubot. However we prodominantly code using Ruby so a switch to Lita was a logical switch.

## Installation

Your Lita instance **must** be on the same machine as an active Spotify session. I.e the app is open.

Add `lita-mac_spotify_control` to your Lita instance's Gemfile:

``` ruby
gem "lita-mac_spotify_control"
```

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
