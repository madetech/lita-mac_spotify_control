require 'rspotify'
require 'lita/handlers/mac_spotify_control/respond'

module Lita::Handlers::MacSpotifyControl
  class Search < Lita::Handler
    namespace 'mac_spotify_control'

    include LitaMacSpotifyControl::Respond

    config :client_id
    config :client_secret

    on :loaded, :authorise_rspotify

    def authorise_rspotify(payload)
      return if config.client_id == nil or config.client_secret == nil
      RSpotify::authenticate(config.client_id, config.client_secret)
    end

    route(%r{^play (artist|album|track|playlist) (.+)$},
          :play_search_result,
          command: true,
          help: { 'play QUERY' => 'Plays the result of supplied QUERY' })

# Album/Artists/Track

    route(%r{^play spotify:(album|artist|track):([a-zA-Z0-9]{22})$},
          :play_spotify_uri,
          command: true,
          help: { 'play SPOTIFY_URI' => 'Plays supplied Spotify URI' })

    route(%r{^play https?:\/\/open.spotify.com\/(album|artist|track)\/([a-zA-Z0-9]{22})\/?$},
          :play_spotify_uri,
          command: true,
          help: { 'play SPOTIFY_URI' => 'Plays supplied Spotify URI' })

# Playlist

    route(%r{^play spotify:user:(.+):playlist:([a-zA-Z0-9]{22})$},
          :play_playlist,
          command: true,
          help: { 'play SPOTIFY_URI' => 'Plays playlist from supplied spotify uri' })

    route(%r{^play https?:\/\/open.spotify.com\/user\/(.+)\/playlist\/([a-zA-Z0-9]{22})\/?$},
          :play_playlist,
          command: true,
          help: { 'play SPOTIFY_URL' => 'Plays playlist from supplied spotify url' })

    def play_spotify_uri(response)
      type = response.match_data[1].to_sym
      spotify_id = response.match_data[2]

      case type
      when :track
        play_track(response, "spotify\:track\:#{spotify_id}")
      when :album, :artist
        context = "spotify\:#{type}\:#{spotify_id}"
        play_track_in_context(response, context, find_first_track(type, spotify_id).uri)
      end
    end

    def play_playlist(response)
      user = response.match_data[1].to_sym
      playlist_id = response.match_data[2]

      playlist = Spotify::Find.send(:playlist, user, playlist_id)

      spotify_request = Spotify::Control.play_in_context(
        playlist.tracks.first.uri,
        playlist.uri)

      respond_to_user(response, spotify_request, spotify_request.stdout)
    end

    def play_search_result(response)
      type = response.match_data[1].to_sym
      query_term = response.match_data[2]

      result = Spotify::Search.send(type, query_term)
      context = result[0].uri

      case type
      when :artist
        play_track_in_context(response, context, result[0].top_tracks(:GB).first.uri)
      when :album, :playlist
        play_track_in_context(response, context, result[0].tracks.first.uri)
      when :track
        play_track(response, context)
      end
    end

    private

    def find_first_track(type, spotify_id)
      result = Spotify::Find.send(type, spotify_id)

      if type == :artist
        result.top_tracks(:GB).first
      else
        result.tracks.first
      end
    end

    def play_track(response, spotify_uri)
      spotify_request = Spotify::Control.play(spotify_uri)

      respond_to_user(response, spotify_request, spotify_request.stdout)
    end

    def play_track_in_context(response, context_uri, track_uri)
      spotify_request = Spotify::Control.play_in_context(track_uri, context_uri)

      respond_to_user(response, spotify_request, spotify_request.stdout)
    end
  end
end

Lita.register_handler(Lita::Handlers::MacSpotifyControl::Search)
