require_relative '../application_test'

module PlanitApp
  class CourseShareTest < ApplicationTest

    def run user_email
      #
      # Scenario 1
      #
      $logger.debug '..SCENARIO 1:'

      $logger.debug '..Create Course'
      @course_share.create

      $logger.debug '..Share Course with user'
      @course_share.share_with_user user_email

      $logger.debug '..Check whether shared user can access the course'
      @course_share.show user_email

      $logger.debug '..Unshare Course from user'
      @course_share.unshare_from_user user_email

      $logger.debug '.. can unshared user access course '
      $logger.debug '..User course has been unshared from should not be able to access the course anymore'
      begin
        @course_share.show user_email
      rescue => e
        e.response
      end

      $logger.debug '..Owner can access the course'
      @course_share.show

      $logger.debug '..Delete Course'
      @course_share.destroy

      #
      # Scenario 2
      #
      $logger.debug '..SCENARIO 2:'

      $logger.debug '..Create Course'
      @course_share.create

      $logger.debug '..Share course'
      @course_share.share_with_user user_email

      $logger.debug '..Check whether shared user can access the course'
      @course_share.show user_email

      @course_assessment.create @course_share.id, user_email

      @course_assessment.show user_email
      @course_assessment.show

      $logger.debug '..Unshare Course from user'
      @course_share.unshare_from_user user_email

      @course_assessment.show user_email

      begin
        @course_assessment.show
      rescue => e
        e.response
      end

      $logger.debug '..Delete course'
      @course_share.destroy

    end
  end
end

#
# Register as a random user and do CRUD operations on Courses
#

registered_email = 'krish@gmail.com'
course = PlanitApp::CourseShareTest.new registered_email
course.drop_db

course.register_user

registered_email2 = 'meena@gmail.com'
course = PlanitApp::CourseShareTest.new registered_email2
course.register_user

course.run registered_email

#
# Scenario 1
#

# Register User: Krish
# Register User: Meena
# As Krish, create course
# As Krish, hare course with Meena
# Verify that Meena can view the shared course

#
# Scenario 2
#

# Register User: Krish
# Register User: Meena
# As Krish, create course
# As Krish, share course with Meena
# As Meena, Create course assessment under that course
# As Krish, unshare course from Meena
# Verify that Meena cannot access the course anymore