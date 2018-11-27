require_relative 'application'
require_relative 'registration/registration'

module PlanitApp
  class Profile < Application
    def initialize email=EMAIL, api_token=API_TOKEN, expiration=EXPIRATION
      super email, api_token, expiration
    end

    def create
      @res = RestClient.post url, payload, header_hash
      @json_data = JSON.parse @res.body
      log_data url, 'POST'
      verify_response_headers 201
      verify_response_body @json_data
    end

    def index
      @res = RestClient.get url, header_hash
      log_data url, 'GET'
      verify_response_headers 200
    end

    def show
      @res = RestClient.get url(@json_data['id']), header_hash
      log_data url(@json_data['id']), 'GET'
      verify_response_headers 200
    end

    def destroy
      @res = RestClient.delete url(@json_data['id']), header_hash
      log_data url(@json_data['id']), 'DELETE'
      verify_response_headers 204
    end

    def update
      @res = RestClient.put url(@json_data["id"]), payload, header_hash
      log_data url(@json_data['id']), 'PUT'
      verify_response_headers 200
      verify_response_body @res.body
    end

    #
    # Private
    #
    private

    def payload
      {profile: [first_name: Faker::Name.first_name, middle_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_name: Faker::Name.name]}
    end

    def url id=nil
      return "#{URL}/profiles/#{id}" if id
      "#{URL}/profiles"
    end

    def verify_response_body body
      verify_resp_body body['id'], body['user_name']
    end
  end
end

