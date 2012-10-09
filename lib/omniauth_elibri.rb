require "omniauth_elibri/version"

require 'omniauth-oauth2'
module OmniAuth
  module Strategies
    class Elibri < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "elibri"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      # ważne, że tutaj MUSI być ssl
      option :client_options, { :site => "https://elibri.com.pl/oauth" }
      
      option :provider_ignores_state, true

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }
      #TODO: tutaj można dopisać parametry, które zbieramy
      info do
        {
          :full_name => raw_info['full_name'],
          :email => raw_info['email'],
          :super_admin => raw_info['super_admin'],
        }
      end

      def raw_info
        @raw_info ||= JSON.parse(access_token.get('/oauth/me').body)
      end
    end
  end
end