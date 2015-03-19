module Spotify
  class Control
    def self.current_volume
      execute_spotify_applescript('sound volume')
    end

    def self.state
      execute_spotify_applescript('player state')
    end

    def self.next_track
      execute_spotify_applescript("next track\n#{show_now_playing}")
    end

    def self.pause
      execute_spotify_applescript('playpause')
    end

    def self.play(uri = nil)
      if uri
        execute_spotify_applescript("play track \"#{uri}\"\n#{show_now_playing}")
      else
        execute_spotify_applescript("play\n#{show_now_playing}")
      end
    end

    def self.play_in_context(track, context)
      if context
        execute_spotify_applescript("play track \"#{track}\" in context \"#{context}\"\n#{show_now_playing}")
      else
        execute_spotify_applescript("play track \"#{track}\"\n#{show_now_playing}")
      end
    end

    def self.previous_track
      execute_spotify_applescript("previous track\n#{show_now_playing}")
    end

    def self.toggle_repeat
      execute_spotify_applescript("set repeating to not repeating\nreturn repeating")
    end

    def self.toggle_shuffle
      execute_spotify_applescript("set shuffling to not shuffling\nreturn shuffling")
    end

    def self.volume(volume)
      execute_spotify_applescript(
        "set sound volume to #{volume}\nreturn sound volume"
      )
    end

    def self.info
      execute_spotify_applescript(
        """
        set litaTrack to name of current track
        set litaArtist to artist of current track
        set litaAlbum to album of current track
        set info to \"Currently Playing:\"
        set info to info & \"\n👤  Artist: \" & litaArtist
        set info to info & \"\n💿  Track:  \" & litaTrack
        set info to info & \"\n💽  Album:  \" & litaAlbum
        set info to info & \"\n💻  URI:    \" & spotify url of current track
        """
      )
    end

    private

    def self.show_now_playing
      """
      delay 1
      set litaTrack to name of current track
      set litaArtist to artist of current track
      set litaTrackDetails to \"🔊  Now Playing: \" & litaTrack & \" by \" & litaArtist
      return litaTrackDetails
      """
    end

    def self.execute_spotify_applescript(command)
      osascript <<-END
        tell application "Spotify"
          #{command}
        end tell
      END
    end
  end
end
