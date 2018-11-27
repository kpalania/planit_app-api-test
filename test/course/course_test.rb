require_relative '../application_test'

module PlanitApp
  class CourseTest < ApplicationTest
    def run

      $logger.debug '..Create Course'
      @course.create

      $logger.debug '..Show Course'
      @course.show

      $logger.debug '..Update Course'
      @course.update

      $logger.debug '..List Courses'
      @course.index

      $logger.debug '..Delete Course'
      @course.destroy

    end
  end
end

#
# Register as a random user and do CRUD operations on Courses
#
course = PlanitApp::CourseTest.new
course.drop_db

course.register_user
course.run
#
# Register as a specific user
#
registered_email = 'krish@gmail.com'
course = PlanitApp::CourseTest.new registered_email
course.register_user
course.run



