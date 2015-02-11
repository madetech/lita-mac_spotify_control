require 'lita'

Lita.load_locales Dir[File.expand_path(
  File.join('..', '..', 'locales', '*.yml'), __FILE__
)]

require 'ruby_osascript'

require 'lita/handlers/mac_spotify_control/info'
require 'lita/handlers/mac_spotify_control/playback'
require 'lita/handlers/mac_spotify_control/seek'

template_files = File.expand_path(
  File.join('..', '..', 'templates'),
 __FILE__
)

Lita::Handlers::MacSpotifyControl::Info.template_root(template_files)
Lita::Handlers::MacSpotifyControl::Playback.template_root(template_files)
Lita::Handlers::MacSpotifyControl::Seek.template_root(template_files)
