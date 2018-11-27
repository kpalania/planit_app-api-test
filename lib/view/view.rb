require_relative '../application'

module PlanitApp
  class View < Application
    def initialize email=EMAIL, api_token=API_TOKEN, expiration=EXPIRATION
      super email, api_token, expiration
    end

    def create
      @res = RestClient.post url, payload, header_hash
      @json_data = JSON.parse @res.body
      log_data url, 'POST'
      verify_response_headers 201
    end


    def index
      @res = RestClient.get url, header_hash
      log_data url, 'GET'
      verify_response_headers 200
    end

    def show
      @res = RestClient.get url(@json_data['id']), header_hash
      log_data url(@json_data["id"]), 'GET'
      verify_response_headers 200
    end

    def destroy
      @res = RestClient.delete url(@json_data['id']), header_hash
      log_data url(@json_data["id"]), 'DELETE'
      verify_response_headers 204
    end

    def update
      @res = RestClient.put url(@json_data['id']), payload_for_update, header_hash
      log_data url(@json_data['id']), 'PUT'
      verify_response_headers 200
    end
    #
    # Private
    #
    private

    def payload
      {view: [
          name: Faker::Name.first_name,
          description: Faker::Name.name,
          type: ['teacher','custom'].sample
      ]}
    end

    def payload_for_update
      {view: [
          name: Faker::Name.first_name,
          description: Faker::Name.name,
      ]}
    end

    def url id=nil
      return "#{URL}/views/#{id}" if id
      "#{URL}/views"
    end

  end
end

