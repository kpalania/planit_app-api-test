require_relative '../application'

module PlanitApp
  class CourseAssessmentType < Application
    def initialize email=EMAIL, api_token=API_TOKEN, expiration=EXPIRATION
      super email, api_token, expiration
    end

    def index
      @res = RestClient.get url, header_hash
      log_data url, 'GET'
      verify_response_headers 200
    end

    def create
      @res = RestClient.post url, payload, header_hash
      verify_response_headers 201
    end

    private

    def payload
      { course_assessment_type: [course_assessment_type_name: Faker::Name.first_name] }
    end

    def url id=nil
      return "#{URL}/course-assessment-types/#{id}" if id
      "#{URL}/course-assessment-types"
    end

    def verify_response_body(body)
      verify_resp_body body['id'], body['course_assessment_type_name']
    end
  end
end

