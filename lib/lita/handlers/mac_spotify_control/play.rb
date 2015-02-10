module Lita::Handlers::MacSpotifyControl
  class Play < Lita::Handler
    namespace "mac_spotify_control"

    route(%r{^(play|start)$},
           :play,
           command: true,
           help: { 'play' => 'Plays spotify',
                   'start' => 'Plays spotify' })

    route(%r{^play spotify:(album|artist|playlist|track):([a-zA-Z0-9]{22})$},
          :play_uri,
          command: true,
          help: { 'play SPOTIFY_URI' => 'Plays supplied Spotify URI' })

    route(%r{^play (.+)$},
          :play_search_result,
          command: true,
          help: { 'play QUERY' => 'Plays the result of supplied QUERY' })


    def play(response)
      # noop
    end

    def play_uri(response)
      # noop
    end

    def play_search_result(response)
      # noop
    end
  end
end

Lita.register_handler(Lita::Handlers::MacSpotifyControl::Play)
