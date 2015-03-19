require 'spec_helper'

describe Lita::Handlers::MacSpotifyControl::Info, lita_handler: true do
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

  it { is_expected.to route_command('track info').to(:info) }
  it { is_expected.to route('whats playing').to(:info) }
  it { is_expected.to route('shazzam').to(:info) }

  context 'display track current track information' do
    let(:spotify_stdout) do
      """
      👤  Artist: Blink 182
      💿  Track:  The Rock Show
      💽  Album:  Take off your pants and jacket
      💻  URI:    http://www.example.com/n/e/uri
      """
    end

    before(:each) do
      allow(Spotify::Control).to receive(:info).and_return(spotify_response)
    end

    context 'when a user commands lita' do
      it 'should return whats playing' do
        send_command("current track")

        ["Artist", "Track", "Album", "URI"].each do |text|
          expect(replies.last).to include(text)
        end
      end
    end

    context 'when a user mentions it in conversation' do
      it 'should return whats playing' do
        send_message("whats playing")

        ["Artist", "Track", "Album", "URI"].each do |text|
          expect(replies.last).to include(text)
        end
      end
    end
  end
end
