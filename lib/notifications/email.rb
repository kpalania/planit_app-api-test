require_relative '../application'

module PlanitApp
  class Email < Application
    def initialize email=EMAIL, api_token=API_TOKEN, expiration=EXPIRATION
      super email, api_token, expiration
    end

    def create
      @res = RestClient.post url, payload, header_hash
      log_data url, 'POST'
      verify_response_headers 200
    end

    #
    # Private
    #
    private

    def payload
      {to: Faker::Internet.free_email, subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph}
    end

    def url
      return "#{URL}/send-email"
    end
  end
end

