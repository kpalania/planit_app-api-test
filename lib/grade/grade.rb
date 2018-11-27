require_relative '../application'

module PlanitApp
  class Grade < Application
    def initialize email=EMAIL, api_token=API_TOKEN, expiration=EXPIRATION
      super email, api_token, expiration
    end

    def create(course_assessment_id)
      @res = RestClient.post url, payload(course_assessment_id), header_hash
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

    def update course_assessment_id
      @res = RestClient.put url(@json_data['id']), payload(course_assessment_id), header_hash
      log_data url(@json_data['id']), 'PUT'
      verify_response_headers 200
      verify_response_body @res.body
    end

    #
    # Private
    #
    private

    def payload(course_assessment_id)
      {grade: {points_scored: "A+", course_assessment_id: course_assessment_id}}
    end

    def url id=nil
      return "#{URL}/grades/#{id}" if id
      "#{URL}/grades"
    end

    def verify_response_body body
      verify_resp_body body['id'], body['points_scored']
    end
  end
end

