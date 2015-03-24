require 'lita/handlers/mac_spotify_control/respond'

module Lita::Handlers::MacSpotifyControl
  class Info < Lita::Handler
    namespace "mac_spotify_control"

    include LitaMacSpotifyControl::Respond

    route(%r{^(?:track info|current track)$},
           :info,
           command: true,
           help: { 'track info|current track' => 'Info about the current track'})

    route(%r{^(?:whats playing|what is playing|shazzam)$},
           :info,
           command: false)

    def info(response)
      spotify_request = Spotify::Control.info

      respond_to_user(response, spotify_request, spotify_request.stdout)
    end
  end
end

Lita.register_handler(Lita::Handlers::MacSpotifyControl::Info)
