require_relative '../application'
require 'uuid'

module PlanitApp
  class Registration < Application
    def initialize email=EMAIL, api_token=API_TOKEN, expiration=EXPIRATION
      super email, api_token, expiration
    end

    def create
      @res = RestClient.post url, payload, header_hash
      @json_data = JSON.parse @res.body
      log_data url, 'POST'
      verify_response_headers 201
      # verify_response_body @json_data
    end

    def destroy
      @res = RestClient.delete url(get_user_uuid @email), header_hash
      log_data url(@json_data['id']), 'DELETE'
      verify_response_headers 204
    end
    #
    # Private
    #
    private

    def payload
      {
          email: @email,
          mapped_uuid: ::UUID.generate
      }
    end

    def url id=nil
      return "#{URL}/users/#{id}" if id
      "#{URL}/users/sign_up"
    end

    def get_user_uuid user_email
      response = RestClient.get "#{URL}/users/#{user_email}", header_hash
      user = JSON.parse response.body
      user['user']['uuid']
    end

    def verify_response_body body
      verify_resp_body body['email'], body['uuid']
    end

  end
end

