module Lita::Handlers::MacSpotifyControl
  class Seek < Lita::Handler
    namespace "mac_spotify_control"

    route(%r{^next$},
           :next,
           command: true,
           help: { 'next' => 'Play next track'})

    route(%r{^(?:previous|prev)$},
           :previous,
           command: true,
           help: { 'previous/prev' => 'Play previous track'})

    def next(response)
      spotify_request = Spotify::Control.next_track

      if spotify_request.stderr != ''
        response.reply(spotify_request.stderr)
      else
        response.reply(spotify_request.stdout)
      end
    end

    def previous(response)
      spotify_request = Spotify::Control.previous_track
      if spotify_request.stderr != ''
        response.reply(spotify_request.stderr)
      else
        response.reply(spotify_request.stdout)
      end
    end
  end
end

Lita.register_handler(Lita::Handlers::MacSpotifyControl::Seek)
