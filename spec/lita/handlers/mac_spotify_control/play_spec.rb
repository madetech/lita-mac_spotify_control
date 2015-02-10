require "spec_helper"

describe Lita::Handlers::MacSpotifyControl::Play, lita_handler: true do
  context 'play/start' do
    it { is_expected.to route_command("start").to(:play) }
    it { is_expected.to route_command("play").to(:play) }
    it { is_expected.to route_command("play Blink 182").to(:play_search_result) }
    it { is_expected.to route_command("play spotify:track:0yhPEz5KxlDwckGJaMlZqM").to(:play_uri) }
  end
end
