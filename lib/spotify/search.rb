require 'rspotify'

module Spotify
  class Search
    def self.artist(artist_name)
      RSpotify::Artist.search(artist_name)
    end

    def self.album(album_name)
      RSpotify::Album.search(album_name)
    end

    def self.track(track_name)
      RSpotify::Track.search(track_name)
    end

    def self.playlist(playlist_name)
      RSpotify::Playlist.search(playlist_name)
    end
  end

  class Find
    def self.artist(artist_id)
      RSpotify::Artist.find(artist_id)
    end

    def self.album(album_id)
      RSpotify::Album.find(album_id)
    end

    def self.track(track_id)
      RSpotify::Track.find(track_id)
    end

    def self.playlist(user_name, playlist_id)
      RSpotify::Playlist.find(user_name, playlist_id)
    end
  end
end
