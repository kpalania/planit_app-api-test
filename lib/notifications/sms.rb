require_relative '../application'

module PlanitApp
  class Sms < Application
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
      {phone: Faker::PhoneNumber.cell_phone, message: Faker::Lorem.sentence}
    end

    def url
      return "#{URL}/send-sms"
    end
  end
end

