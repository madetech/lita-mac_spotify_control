require 'lita/handlers/mac_spotify_control/respond'

module Lita::Handlers::MacSpotifyControl
  class Seek < Lita::Handler
    namespace 'mac_spotify_control'

    include LitaMacSpotifyControl::Respond

    route(%r{^next$},
           :next,
           command: true,
           help: { 'next' => 'Play next track' })

    route(%r{^(?:previous|prev)$},
           :previous,
           command: true,
           help: { 'previous/prev' => 'Play previous track' })

    def next(response)
      spotify_request = Spotify::Control.next_track

      respond_to_user(response, spotify_request, spotify_request.stdout)
    end

    def previous(response)
      spotify_request = Spotify::Control.previous_track

      respond_to_user(response, spotify_request, spotify_request.stdout)
    end
  end
end

Lita.register_handler(Lita::Handlers::MacSpotifyControl::Seek)
