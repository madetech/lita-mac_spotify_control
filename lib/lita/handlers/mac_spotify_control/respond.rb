module LitaMacSpotifyControl
  module Respond
    def respond_to_user(response, spotify_request, reply_text)
      if can_reply?(spotify_request)
        response.reply(reply_text)
      end
    end

    def can_reply?(spotify_request)
      spotify_request.stderr == ''
    end
  end
end
