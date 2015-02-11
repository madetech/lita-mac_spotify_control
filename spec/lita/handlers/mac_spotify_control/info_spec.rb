require 'spec_helper'

describe Lita::Handlers::MacSpotifyControl::Info, lita_handler: true do
  context 'info/whats playing/shazzam' do
    it { is_expected.to route_command('info').to(:info) }
    it { is_expected.to route('whats playing').to(:info) }
    it { is_expected.to route('shazzam').to(:info) }
  end

  context 'search/look for/find me' do
    it { is_expected.to route_command('search New Found Glory').to(:search) }
    it { is_expected.to route_command('look for The Starting Line').to(:search) }
    it { is_expected.to route_command('find me Rufio').to(:search) }
  end
end
