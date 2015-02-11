module Lita::Handlers::MacSpotifyControl
  class Playback < Lita::Handler
    namespace "mac_spotify_control"

    route(%r{^(?:play|start)$},
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

    route(%r{^repeat$},
          :toggle_repeat,
          command: true,
          help: { 'repeat' => 'Toggle repeat on/off' })

    route(%r{^shuffle$},
          :toggle_shuffle,
          command: true,
          help: { 'shuffle' => 'Toggle shuffling on/off' })

    route(%r{^volume (up|down|\d{2})$},
          :volume,
          command: true,
          help: { 'shuffle' => 'Toggle shuffling on/off' })

    def play(response)
      # noop
    end

    def play_uri(response)
      # noop
    end

    def play_search_result(response)
      # noop
    end

    def toggle_repeat(response)
      # noop
    end

    def toggle_shuffle(response)
      # noop
    end

    def volume(response)
      # noop
    end
  end
end

Lita.register_handler(Lita::Handlers::MacSpotifyControl::Playback)
