require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Frederick < OmniAuth::Strategies::OAuth2
      option :name, :frederick

      option :client_options, {
        :site => "https://hirefrederick.com",
        :authorize_url => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"],
          :first_name => raw_info["first_name"],
          :last_name => raw_info["last_name"],
          :business_id => raw_info["business_id"],
          :is_consumer_only => raw_info["is_consumer_only"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/users/me').parsed
      end
    end
  end
end
