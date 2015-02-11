require 'spec_helper'

describe Lita::Handlers::MacSpotifyControl::Playback, lita_handler: true do
  context 'play/start' do
    it { is_expected.to route_command('start').to(:play) }
    it { is_expected.to route_command('play').to(:play) }
    it { is_expected.to route_command('play Blink 182').to(:play_search_result) }
    it { is_expected.to route_command('play spotify:track:0yhPEz5KxlDwckGJaMlZqM').to(:play_uri) }
  end

  context 'repeat' do
    it { is_expected.to route_command('repeat').to(:toggle_repeat) }
  end

  context 'shuffle' do
    it { is_expected.to route_command('shuffle').to(:toggle_shuffle) }
  end

  context 'volume' do
    it { is_expected.to route_command("volume").to(:volume) }
    it { is_expected.to route_command("volume up").to(:volume) }
    it { is_expected.to route_command("volume down").to(:volume) }
    it { is_expected.to route_command("volume 11").to(:volume) }
  end
end
