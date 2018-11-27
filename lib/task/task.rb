require_relative '../application'

module PlanitApp
  class Task < Application
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
      log_data url(@json_data["id"]), 'GET'
      verify_response_headers 200
    end

    def destroy
      @res = RestClient.delete url(@json_data['id']), header_hash
      log_data url(@json_data["id"]), 'DELETE'
      verify_response_headers 204
    end

    def update
      @res = RestClient.put url(@json_data['id']), payload, header_hash
      log_data url(@json_data['id']), 'PUT'
      verify_response_headers 200
    end

    #
    # Private
    #
    private

    def payload
      {task: [name: Faker::Name.name,
              type: Faker::Name.first_name,
              description: Faker::Name.name,
              due_date: @time,
              file_url: Faker::Avatar.image('my-own-slug', '50x50')
      ]}
    end

    def url id=nil
      return "#{URL}/tasks/#{id}" if id
      "#{URL}/tasks"
    end

    def verify_response_body body
      verify_resp_body body["id"], body["type"]
    end
  end
end

