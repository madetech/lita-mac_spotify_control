require 'spec_helper'

describe Lita::Handlers::MacSpotifyControl::Seek, lita_handler: true do
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

  it { is_expected.to route_command('next').to(:next) }
  it { is_expected.to route_command('prev').to(:previous) }
  it { is_expected.to route_command('previous').to(:previous) }

  context 'seeking commands' do
    let(:spotify_stdout) { 'Now Playing: this by that' }

    context 'next' do
      it 'should tell the user its current state' do
        allow(Spotify::Control).to receive(:next_track).and_return(spotify_response)

        send_command("next")
        expect(replies.last).to include("Now Playing")
      end
    end

    context 'previous' do
      it 'should tell the user its current state' do
        allow(Spotify::Control).to receive(:previous_track).and_return(spotify_response)

        send_command("previous")
        expect(replies.last).to include("Now Playing")
      end
    end
  end
end
