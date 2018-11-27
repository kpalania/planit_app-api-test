require_relative 'application_test'

module PlanitApp
  class ProfileTest < ApplicationTest
    def run
      $logger.debug '..Create Profile'
      @profile.create

      $logger.debug '..Show Profile'
      @profile.show

      $logger.debug '..Update Profile'
      @profile.update

      $logger.debug '..List Profiles'
      @profile.index

      $logger.debug '..Delete Profile'
      @profile.destroy
    end
  end
end

#
# Register as a random user and do CRUD operations on Profiles
#
profile = PlanitApp::ProfileTest.new
profile.drop_db
profile.register_user
profile.run

#
# Register as a specific user
#
registered_email = 'krish@gmail.com'
profile = PlanitApp::ProfileTest.new registered_email
profile.register_user
profile.run



