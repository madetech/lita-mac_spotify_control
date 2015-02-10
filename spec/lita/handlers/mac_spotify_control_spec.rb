# require "spec_helper"

# describe Lita::Handlers::MacSpotifyControl, lita_handler: true do
#   context 'play/start' do
#     it { is_expected.to route("start").to(:play) }
#     it { is_expected.to route("play").to(:play) }
#     it { is_expected.to route("play Blink 182").to(:play) }
#     it { is_expected.to route("play spotify:track:0yhPEz5KxlDwckGJaMlZqM").to(:play) }
#   end

#   context 'pause/stop' do
#     it { is_expected.to route("pause").to(:pause) }
#     it { is_expected.to route("stop").to(:pause) }
#   end

#   context 'next' do
#     it { is_expected.to route("next").to(:next) }
#   end

#   context 'previous/prev' do
#     it { is_expected.to route("prev").to(:next) }
#     it { is_expected.to route("previous").to(:next) }
#   end

#   context 'info' do
#     it { is_expected.to route("info").to(:info) }
#   end

#   context 'jump' do
#     it { is_expected.to route("jump").to(:jump) }
#   end

#   context 'ffwd' do
#     it { is_expected.to route("ffwd").to(:fast_forward) }
#   end

#   context 'rewind' do
#     it { is_expected.to route("rewind").to(:rewind) }
#     it { is_expected.to route("be kind rewind").to(:rewind) }
#   end

#   context 'shuffle' do
#     it { is_expected.to route("shuffle").to(:shuffle) }
#   end

#   context 'search/look for/find me' do
#     it { is_expected.to route("search").to(:search) }
#     it { is_expected.to route("look for").to(:search) }
#     it { is_expected.to route("find me").to(:search) }
#   end

#   context 'repeat' do
#     it { is_expected.to route("repeat").to(:repeat) }
#   end

#   context 'volume' do
#     it { is_expected.to route("volume").to(:volume) }
#   end
# end
