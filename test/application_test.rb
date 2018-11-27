require 'faker'
require_relative '../lib/profile'
require_relative '../lib/registration/registration'
require_relative '../lib/course/course'
require_relative '../lib/course/course_share'
require_relative '../lib/course/course_type'
require_relative '../lib/course/course_assessment'
require_relative '../lib/course/course_assessment_share'
require_relative '../lib/course/course_assessment_type'
require_relative '../lib/grade/grade'
require_relative '../lib/task/task'
require_relative '../lib/team/team'
require_relative '../lib/notifications/sms'
require_relative '../lib/notifications/email'
require_relative '../lib/view/view'

module PlanitApp
  class ApplicationTest
    attr_accessor :profile
    $logger = Logger.new LOG_FILE
    $logger.level = Logger::INFO

    API_TOKEN = '6ac1a39cfe3b826b5ca7c78a54e2765898ec2527'
    EXPIRATION = (Time.now + 24*60*60).utc
    EMAIL = Faker::Internet.email

    def initialize email=EMAIL, api_token=API_TOKEN, expiration=EXPIRATION
      @email = email
      @api_token = api_token
      @expiration = expiration

      @register = PlanitApp::Registration.new @email, @api_token, @expiration
      @profile = PlanitApp::Profile.new @email, @api_token, @expiration

      @course = PlanitApp::Course.new @email, @api_token, @expiration
      @course_share = PlanitApp::CourseShare.new @email, @api_token, @expiration
      @course_assessment = PlanitApp::CourseAssessment.new @email, @api_token, @expiration
      @course_assessment_share = PlanitApp::CourseAssessmentShare.new @email, @api_token, @expiration
      @course_type = PlanitApp::CourseType.new @email, @api_token, @expiration
      @course_assessment_type = PlanitApp::CourseAssessmentType.new @email, @api_token, @expiration

      @grade = PlanitApp::Grade.new @email, @api_token, @expiration
      @view = PlanitApp::View.new @email, @api_token, @expiration
      @task = PlanitApp::Task.new @email, @api_token, @expiration
      @team = PlanitApp::Team.new @email, @api_token, @expiration
      @sms = PlanitApp::Sms.new @email, @api_token, @expiration
      @mail = PlanitApp::Email.new @email, @api_token, @expiration
    end

    def register_user
      $logger.info "..Register user: #{@email}"
      @register.create
    end

    def destroy_user
      $logger.info "..delete user: #{@email}"
      @register.destroy
    end

    def drop_db
      db = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'plan_api_dev')
      db.database.drop
    end

  end
end


