require 'spec_helper'
require 'ostruct'

describe Lita::Handlers::MacSpotifyControl::Search, lita_handler: true do
  let(:spotify_stderr) { '' }
  let(:spotify_stdout) { '' }
  let(:spotify_status) { '' }

  let(:spotify_response) do
    OpenStruct.new(
      stdout: spotify_stdout,
      stderr: spotify_stderr,
      status: spotify_status
    )
  end

  it { is_expected.to route_command('play artist Blink 182').to(:play_search_result) }
  it { is_expected.to route_command('play album Take off your pants jacket').to(:play_search_result) }
  it { is_expected.to route_command('play track The Rock Show').to(:play_search_result) }
  it { is_expected.to route_command('play playlist Rock').to(:play_search_result) }

  it { is_expected.to route_command('play https://open.spotify.com/track/0x8D3L0JDAxPHooR2CCMI0').to(:play_spotify_uri) }
  it { is_expected.to route_command('play spotify:track:0yhPEz5KxlDwckGJaMlZqM').to(:play_spotify_uri) }
  it { is_expected.to route_command('play https://open.spotify.com/album/0x8D3L0JDAxPHooR2CCMI0').to(:play_spotify_uri) }
  it { is_expected.to route_command('play spotify:album:0yhPEz5KxlDwckGJaMlZqM').to(:play_spotify_uri) }
  it { is_expected.to route_command('play https://open.spotify.com/artist/0x8D3L0JDAxPHooR2CCMI0').to(:play_spotify_uri) }
  it { is_expected.to route_command('play spotify:artist:0yhPEz5KxlDwckGJaMlZqM').to(:play_spotify_uri) }

  it { is_expected.to route_command('play https://open.spotify.com/user/s-n-e-ashton/playlist/7gkEpOdR1znO8cCkTLZySc').to(:play_playlist) }
  it { is_expected.to route_command('play spotify:user:s-n-e-ashton:playlist:7gkEpOdR1znO8cCkTLZySc').to(:play_playlist) }

  context 'searching spotify' do
    let(:spotify_stdout) { 'Now Playing: this by that' }
    let(:rspotify_response) do
      double(
        uri: 'aUri',
        tracks: [double(uri: 'anotherUri')]
      )
    end

    before(:each) do
      allow(Spotify::Control).to receive(:play_in_context).and_return(spotify_response)
      allow(Spotify::Control).to receive(:play).and_return(spotify_response)
    end

    context 'for an artist' do
      let(:rspotify_response) do
        double(
          uri: 'aUri',
          top_tracks: [double(uri: 'anotherUri')]
        )
      end

      it 'should display now playing' do
        allow(Spotify::Search).to receive(:artist).and_return([rspotify_response])
        send_command('play artist Blink 182')
        expect(replies.last).to include('Now Playing')
      end
    end

    context 'for an album' do
      it 'should display now playing' do
        allow(Spotify::Search).to receive(:album).and_return([rspotify_response])
        send_command('play album Take off your pants and jacket')
        expect(replies.last).to include('Now Playing')
      end
    end

    context 'for a playlist [Seb] Punk Rock 101' do
      it 'should display now playing' do
        allow(Spotify::Search).to receive(:playlist).and_return([rspotify_response])
        send_command('play playlist Punk Rock 101')
        expect(replies.last).to include('Now Playing')
      end
    end

    context 'for a track Danger Zone' do
      it 'should display now playing' do
        allow(Spotify::Search).to receive(:track).and_return([rspotify_response])
        send_command('play track Danger Zone')
        expect(replies.last).to include('Now Playing')
      end
    end
  end

  context 'playing a specific spotify uri' do
    let(:spotify_stdout) { 'Now Playing: this by that' }
    let(:rspotify_response) do
      double(
        uri: 'aUri',
        tracks: [double(uri: 'anotherUri')]
      )
    end

    before(:each) do
      allow(Spotify::Control).to receive(:play_in_context).and_return(spotify_response)
      allow(Spotify::Control).to receive(:play).and_return(spotify_response)
    end

    context 'for an artist' do
      let(:rspotify_response) do
        double(
          uri: 'aUri',
          top_tracks: [double(uri: 'anotherUri')]
        )
      end

      it 'should display now playing' do
        allow(Spotify::Find).to receive(:artist).and_return(rspotify_response)
        send_command('play spotify:artist:71h7GTahhKcSkQ1ayhTvOD')
        expect(replies.last).to include('Now Playing')
      end
    end

    context 'for an album' do
      it 'should display now playing' do
        allow(Spotify::Find).to receive(:album).and_return(rspotify_response)
        send_command('play spotify:album:5gsEd84TFIgM6R4WIOWnua')
        expect(replies.last).to include('Now Playing')
      end
    end

    context 'for a playlist [Seb] Punk Rock 101' do
      it 'should display now playing' do
        allow(Spotify::Find).to receive(:playlist).and_return(rspotify_response)
        send_command('play spotify:user:s-n-e-ashton:playlist:7gkEpOdR1znO8cCkTLZySc')
        expect(replies.last).to include('Now Playing')
      end
    end

    context 'for a track Danger Zone' do
      it 'should display now playing' do
        allow(Spotify::Find).to receive(:track).and_return(rspotify_response)
        send_command('play spotify:track:3yjcigjXEcf2JkZKzPPFne')
        expect(replies.last).to include('Now Playing')
      end
    end
  end
end
