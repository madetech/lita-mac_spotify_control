require 'spec_helper'

describe Lita::Handlers::MacSpotifyControl::Seek, lita_handler: true do
  context 'next' do
    it { is_expected.to route_command('next').to(:next) }
  end

  context 'previous/prev' do
    it { is_expected.to route_command('prev').to(:previous) }
    it { is_expected.to route_command('previous').to(:previous) }
  end
end
