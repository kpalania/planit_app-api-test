require_relative '../application_test'

module PlanitApp
  class CourseAssessmentTypeTest < ApplicationTest
    def run
      $logger.debug '..Create a Course Assessment Type'
      @course_assessment_type.create

      $logger.debug '..List Course Assessment Types'
      @course_assessment_type.index
    end
  end
end

#
# Register as a random user and do CRUD operations on Course Assessment Types
#
course_assessment_type = PlanitApp::CourseAssessmentTypeTest.new
course_assessment_type.drop_db
course_assessment_type.register_user
course_assessment_type.run

#
# Register as a specific user
#
registered_email = 'krish@gmail.com'
course_assessment_type = PlanitApp::CourseAssessmentTypeTest.new registered_email
course_assessment_type.register_user
course_assessment_type.run



