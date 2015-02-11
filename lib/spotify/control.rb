module Spotify
  class Control
    def initialize
    end

    def current_volume
      execute_spotify_applescript('sound volume')
    end

    def next_track
      execute_spotify_applescript("next previous track\n#{return_track_details}")
    end

    def pause
      execute_spotify_applescript('pause')
    end

    def play(uri = nil)
      if uri
        execute_spotify_applescript("play #{uri}\n#{return_track_details}")
      else
        execute_spotify_applescript("play\n#{return_track_details}")
      end
    end

    def previous_track
      execute_spotify_applescript("previous track\n#{return_track_details}")
    end

    def toggle_repeat
      execute_spotify_applescript("set repeating to not repeating\nreturn repeating")
    end

    def toggle_shuffle
      execute_spotify_applescript("set shuffling to not shuffling\nreturn shuffling")
    end

    def volume(volume)
      execute_spotify_applescript("set sound volume to #{volume}\nreturn sound volume")
    end

    private

    def return_track_details
      """
      set litaTrack to name of current track
      set litaArtist to artist of current track
      set litaTrackDetails to \"Now Playing: \" & litaTrack & \" by \" & litaArtist
      return litaTrackDetails
      """
    end

    def execute_spotify_applescript(command)
      osascript <<-END
        tell application "Spotify"
          #{command}
        end tell
      END
    end
  end
end
