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
      # noop
    end

    def previous(response)
      # noop
    end
  end
end

Lita.register_handler(Lita::Handlers::MacSpotifyControl::Seek)
