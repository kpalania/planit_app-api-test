require_relative '../application_test'

module PlanitApp
  class CourseAssessmentTest < ApplicationTest
    def run
      $logger.debug '..Create Course Assessment'
      @course_assessment.create

      $logger.debug '..Show Course Assessment'
      @course_assessment.show

      $logger.debug '..Update Course Assessment'
      @course_assessment.update

      $logger.debug '..List Course Assessments'
      @course_assessment.index

      $logger.debug '..Delete Course Assessment'
      @course_assessment.destroy
    end
  end
end

#
# Register as a random user and do CRUD operations on Course Assessments
#
course_assessment = PlanitApp::CourseAssessmentTest.new
course_assessment.drop_db
course_assessment.register_user
course_assessment.run

#
# Register as a specific user
#
registered_email = 'krish@gmail.com'
course_assessment = PlanitApp::CourseAssessmentTest.new registered_email
course_assessment.register_user
course_assessment.run

#
# Create course assessment as a previously registered user
#
course_assessment = PlanitApp::CourseAssessmentTest.new registered_email
course_assessment.run


