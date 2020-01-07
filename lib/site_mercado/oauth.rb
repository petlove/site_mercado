# frozen_string_literal: true

module SiteMercado
  class Oauth
    attr_reader :access_token, :expires_in

    def client_id
      @client_id ||= SiteMercado.configuration.client_id
    end

    def client_secret
      @client_secret ||= SiteMercado.configuration.client_secret
    end

    def token
      return access_token if access_token && !expired?

      fetch_token
    end

    def expired?
      expires_in < Time.now
    end

    private

    def fetch_token
      response = Client.post('/oauth/token', body: credentials, auth: false)
      @token_type = response['token_type']
      @expires_in = Time.now + response['expires_in'].to_i
      @access_token = response['access_token']
    end

    def credentials
      {
        client_id: client_id,
        client_secret: client_secret
      }
    end
  end
end
