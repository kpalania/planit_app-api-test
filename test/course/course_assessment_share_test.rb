require_relative '../application_test'

module PlanitApp
  class CourseAssessmentShareTest < ApplicationTest
    def run user_email
      $logger.debug '..Create Course Assessment'
      @course_assessment_share.create

      $logger.debug '..Share Course Assessment with user'
      @course_assessment_share.share_with_user user_email

      $logger.debug '..Verify Shared user can access the assessment'
      @course_assessment_share.show user_email
      @course_assessment_share.show

      $logger.debug '..Unshare Course Assessment from user'
      @course_assessment_share.unshare_from_user user_email

      $logger.debug '..Verify Unshared user can access the assessment'
      begin
        @course_assessment_share.show user_email
      rescue => e
        $logger.debug '..User does not have access to course assessment'
      end
      @course_assessment_share.show

      $logger.debug '..Transfer Ownership'
      @course_assessment_share.transfer_owner_ship user_email

      $logger.debug '..Delete Course Assessment'
      #@course_assessment_share.destroy
    end
  end
end

#
# Register as a random user and do CRUD operations on Course Assessments
#
registered_email = 'krish@gmail.com'
course_assessment = PlanitApp::CourseAssessmentShareTest.new registered_email
course_assessment.drop_db
course_assessment.register_user

registered_email2 = 'meena@gmail.com'
course_assessment = PlanitApp::CourseAssessmentShareTest.new registered_email2
course_assessment.register_user

course_assessment.run registered_email
