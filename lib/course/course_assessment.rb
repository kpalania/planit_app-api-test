require_relative '../application'

module PlanitApp
  class CourseAssessment < Application
    def initialize email=EMAIL, api_token=API_TOKEN, expiration=EXPIRATION
      super email, api_token, expiration
    end

    def create course_id=nil, user_email=nil
      @res = RestClient.post url, payload(course_id), header_hash(user_email)
      @json_data = JSON.parse @res.body
      log_data url, 'POST'
      verify_response_headers 201
      verify_response_body @json_data
    end

    def id
      @json_data["id"]
    end

    def index
      @res = RestClient.get url, header_hash
      log_data url, 'GET'
      verify_response_headers 200
    end

    def show user_email=nil
      @res = RestClient.get url(@json_data['id']), header_hash(user_email)
      log_data url(@json_data['id']), 'GET'
      verify_response_headers 200
    end

    def destroy
      @res = RestClient.delete url(@json_data['id']), header_hash
      log_data url(@json_data['id']), 'DELETE'
      verify_response_headers 204
    end

    def update
      @res = RestClient.put url(@json_data['id']), payload, header_hash
      log_data url(@json_data['id']), 'PUT'
      verify_response_headers 200
      verify_response_body @res.body
    end


    #
    # Private
    #
    private

    def payload course_id=nil
      {course_assessment: [course_assessment_description: Faker::Lorem.sentence(3),
                           course_assessment_type_name: Faker::Name.first_name,
                           course_assessment_name: Faker::Name.last_name,
                           course_assessment_due_date: @time,
                           course_assessment_file_url: Faker::Avatar.image('my-own-slug', '50x50'),
                           course_assessment_file: Faker::Avatar.image('my-own-slug', '50x50')],
       course_id: course_id,
       current_user: Faker::Internet.email
      }
    end

    def url id=nil
      return "#{URL}/course-assessments/#{id}" if id
      "#{URL}/course-assessments"
    end

    def verify_response_body body
      verify_resp_body body['id'], body['course_assessment_name']
    end
  end
end

