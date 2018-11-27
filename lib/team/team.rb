require_relative '../application'

module PlanitApp
  class Team < Application
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
      @res = RestClient.delete delete_url(@json_data['team']['id'], @json_data['team']['users'][0]['uuid']), header_hash
      log_data delete_url(@json_data['team']['id'], @json_data['team']['users'][0]['uuid']), 'DELETE'
      verify_response_headers 204
    end

    #
    # Private
    #
    private

    def payload
      {
          team: {
              name: "Test team",
              users: {
                  '': [
                      {email: "krish@gmail.com"},
                      {email: "meena@gmail.com"}
                  ]
              }
          }
      }
    end

    def url id=nil
      return "#{URL}/teams/#{id}" if id
      "#{URL}/teams"
    end

    def delete_url id, user_id
      "#{URL}/teams/#{id}/users/#{user_id}"
    end
  end
end

