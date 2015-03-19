module Lita::Handlers::MacSpotifyControl
  class Info < Lita::Handler
    namespace "mac_spotify_control"

    route(%r{^(?:track info|current track)$},
           :info,
           command: true,
           help: { 'track info|current track' => 'Info about the current track'})

    route(%r{^(?:whats playing|what is playing|shazzam)$},
           :info,
           command: false)

    def info(response)
      spotify_request = Spotify::Control.info

      if spotify_request.stderr != ''
        response.reply(spotify_request.stderr)
      else
        response.reply(spotify_request.stdout)
      end
    end
  end
end

Lita.register_handler(Lita::Handlers::MacSpotifyControl::Info)
