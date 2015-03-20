require 'lita'
require 'rspotify'

Lita.load_locales Dir[File.expand_path(
  File.join('..', '..', 'locales', '*.yml'), __FILE__
)]

require 'ruby_osascript'

RSpotify::authenticate(Lita.config.handlers.mac_spotify_control.client_id,
                       Lita.config.handlers.mac_spotify_control.client_secret)

require 'spotify/control'
require 'spotify/search'

require 'lita/handlers/mac_spotify_control/info'
require 'lita/handlers/mac_spotify_control/playback'
require 'lita/handlers/mac_spotify_control/search'
require 'lita/handlers/mac_spotify_control/seek'

template_files = File.expand_path(
  File.join('..', '..', 'templates'),
 __FILE__
)

Lita::Handlers::MacSpotifyControl::Info.template_root(template_files)
Lita::Handlers::MacSpotifyControl::Playback.template_root(template_files)
Lita::Handlers::MacSpotifyControl::Search.template_root(template_files)
Lita::Handlers::MacSpotifyControl::Seek.template_root(template_files)
