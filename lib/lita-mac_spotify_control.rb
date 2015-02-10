require "lita"

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require 'ruby_osascript'

require 'lita/handlers/mac_spotify_control/play'

Lita::Handlers::MacSpotifyControl::Play.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
