require 'spec_helper'
require 'ostruct'

describe Lita::Handlers::MacSpotifyControl::Playback, lita_handler: true do
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

  it { is_expected.to route_command('play').to(:play) }
  it { is_expected.to route_command('pause').to(:pause) }

  context 'general playback functions' do
    context 'play' do
      let(:spotify_stdout) { 'Now Playing: this by that' }

      it 'should tell the user its current state' do
        allow(Spotify::Control).to receive(:play).and_return(spotify_response)

        send_command("play")
        expect(replies.last).to include("Now Playing")
      end
    end

    context 'pause' do
      let(:spotify_stdout) { 'paused' }

      it 'should tell the user its current state' do
        allow(Spotify::Control).to receive(:pause).and_return(spotify_response)
        allow(Spotify::Control).to receive(:state).and_return(spotify_response)

        send_command("pause")
        expect(replies.last).to eq("Spotify is now #{spotify_stdout}")
      end
    end
  end

  it { is_expected.to route_command('repeat').to(:toggle_repeat) }
  it { is_expected.to route_command('shuffle').to(:toggle_shuffle) }

  context 'toggling playback functions' do
    let(:spotify_stdout) { 'false' }

    context 'repeat' do
      it 'should tell the user the current repeat state' do
        allow(Spotify::Control).to receive(:toggle_repeat).and_return(spotify_response)

        send_command("repeat")
        expect(replies.last).to eq("I've turned repeat on")
      end
    end

    context 'shuffle' do
      it 'should tell the user the current shuffle state' do
        allow(Spotify::Control).to receive(:toggle_shuffle).and_return(spotify_response)

        send_command("shuffle")
        expect(replies.last).to eq("I've turned shuffle on")
      end
    end
  end

  it { is_expected.to route_command("volume").to(:volume) }
  it { is_expected.to route_command("volume up").to(:control_volume) }
  it { is_expected.to route_command("volume down").to(:control_volume) }
  it { is_expected.to route_command("volume 1").to(:control_volume) }
  it { is_expected.to route_command("volume 10").to(:control_volume) }

  context 'volume commands' do
    before(:each) do
      allow(Spotify::Control).to receive(:current_volume).and_return(spotify_response)
      allow(Spotify::Control).to receive(:volume).and_return(spotify_response)
    end

    context 'asked about current volume' do
      let(:spotify_stdout) { '10' }

      it "should return the current volume" do
        send_command("volume")
        expect(replies.last).to eq("Current volume is 1")
      end
    end

    context 'asked to turn up the volume' do
      let(:spotify_stdout) { '20' }

      it "should return the new volume" do
        send_command("volume up")
        expect(replies.last).to eq("Volume set to 3")
      end
    end
  end
end
