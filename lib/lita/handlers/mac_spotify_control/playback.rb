module Lita::Handlers::MacSpotifyControl
  class Playback < Lita::Handler
    namespace "mac_spotify_control"

    route(%r{^(?:play)$},
           :play,
           command: true,
           help: { 'play' => 'Plays spotify' })

    route(%r{^pause$},
          :pause,
          command: true,
          help: { 'pause' => 'Pause Spotify' })

    route(%r{^repeat$},
          :toggle_repeat,
          command: true,
          help: { 'repeat' => 'Toggle repeat on/off' })

    route(%r{^shuffle$},
          :toggle_shuffle,
          command: true,
          help: { 'shuffle' => 'Toggle shuffling on/off' })

    route(%r{^volume$},
          :volume,
          command: true,
          help: { 'volume' => 'Current volume' })

    route(%r{^volume (up|down|\d{1}|10)$},
          :control_volume,
          command: true,
          help: { 'volume up|down|1-10' => 'Change volume' })

    def play(response)
      spotify_request = Spotify::Control.play

      if spotify_request.stderr != ''
        response.reply(spotify_request.stderr)
      else
        response.reply(spotify_request.stdout)
      end
    end

    def pause(response)
      spotify_request = Spotify::Control.pause

      if spotify_request.stderr != ''
        response.reply(spotify_request.stderr)
      else
        response.reply("Spotify is now #{Spotify::Control.state.stdout}")
      end
    end

    def toggle_repeat(response)
      spotify_request = Spotify::Control.toggle_repeat

      if spotify_request.stderr != ''
        response.reply(spotify_request.stderr)
      else
        repeat_on = !(spotify_request.stdout == "true")
        response.reply("I've turned repeat #{ if repeat_on then 'on' else 'off' end}")
      end
    end

    def toggle_shuffle(response)
      spotify_request = Spotify::Control.toggle_shuffle

      if spotify_request.stderr != ''
        response.reply(spotify_request.stderr)
      else
        shuffle_on = !(spotify_request.stdout == 'true')
        response.reply("I've turned shuffle #{ if shuffle_on then 'on' else 'off' end}")
      end
    end

    def volume(response)
      spotify_request = Spotify::Control.current_volume

      if spotify_request.stderr != ''
        response.reply(spotify_request.stderr)
      else
        lita_reply = spotify_request.stdout.to_i.round(-1)
        response.reply("Current volume is #{lita_reply/10}")
      end
    end

    def control_volume(response)
      match = response.match_data[1]

      response.reply(set_volume(match))
    end

    private

    def set_volume(match)
      spotify_request = Spotify::Control.current_volume

      if spotify_request.stderr != ''
        return spotify_request.stderr
      end

      current_volume = spotify_request.stdout.to_i.round(-1)

      case match
      when 'up'
        new_volume = current_volume + 10
      when 'down'
        new_volume = current_volume - 10
      else
        new_volume = (100/10) * match.to_i
      end

      if new_volume < 0
        new_volume = 0
      elsif new_volume > 100
        new_volume = 100
      end

      Spotify::Control.volume(new_volume)

      "Volume set to #{new_volume/10}"
    end
  end
end

Lita.register_handler(Lita::Handlers::MacSpotifyControl::Playback)
