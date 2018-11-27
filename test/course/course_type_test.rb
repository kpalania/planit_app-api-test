require_relative '../application_test'

module PlanitApp
  class CourseTypeTest < ApplicationTest
    def run
      $logger.debug '..Create a Course Type'
      @course_type.create

      $logger.debug '..List Course Types'
      @course_type.index
    end
  end
end

#
# Register as a random user and do CRUD operations on Course Types
#
course_type = PlanitApp::CourseTypeTest.new
course_type.drop_db
course_type.register_user
course_type.run

#
# Register as a specific user
#
registered_email = 'krish@gmail.com'
course_type = PlanitApp::CourseTypeTest.new registered_email
course_type.register_user
course_type.run

#
# Create course type as a previously registered user
#
course_type = PlanitApp::CourseTypeTest.new registered_email
course_type.run


