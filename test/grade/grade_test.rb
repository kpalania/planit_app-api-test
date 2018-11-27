require_relative '../application_test'

module PlanitApp
  class GradeTest < ApplicationTest
    def run
      $logger.debug '..Create Grade'
      @course_assessment.create

      $logger.debug '..Create Grade'
      @grade.create(@course_assessment.id)

      $logger.debug '..Show Grade'
      @grade.show

      $logger.debug '..Update Grade'
      @grade.update(@course_assessment.id)

      $logger.debug '..List Grades'
      @grade.index

      # $logger.debug '..Delete Grade'
      # @grade.destroy
      # @course_assessment.destroy
    end
  end
end

#
# Register as a random user and do CRUD operations on Grades
#
grade = PlanitApp::GradeTest.new
grade.drop_db
grade.register_user
grade.run

#
# Register as a specific user
#
registered_email = 'krish@gmail.com'
grade = PlanitApp::GradeTest.new registered_email
grade.register_user
grade.run



