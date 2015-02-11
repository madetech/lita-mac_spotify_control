module Lita::Handlers::MacSpotifyControl
  class Info < Lita::Handler
    namespace "mac_spotify_control"

    route(%r{^(?:info)$},
           :info,
           command: true,
           help: { 'info|whats playing|what is playing|shazzam' => 'Info about the current track'})

    route(%r{^(?:info|whats playing|what is playing|shazzam)$},
           :info,
           command: false)

    route(%r{^(?:search|look for|find me) (.+)$},
           :search,
           command: true,
           help: { 'search|look for|find me QUERY' => 'Search for QUERY'})

    def search(response)
      # noop
    end

    def info(response)
      # noop
    end
  end
end

Lita.register_handler(Lita::Handlers::MacSpotifyControl::Info)
