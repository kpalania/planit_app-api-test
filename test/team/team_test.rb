require_relative '../application_test'

module PlanitApp
  class TeamTest < ApplicationTest
    def run
      $logger.debug '..Create Team'
      @team.create

      $logger.debug '..Show Team'
      @team.show

      $logger.debug '..List Teams'
      @team.index

      $logger.debug '..Delete Team User'
      @team.destroy
    end
  end
end

#
# Register as specific users, first, so there are members to add to a team.
#
registered_email = 'krish@gmail.com'
team = PlanitApp::TeamTest.new registered_email
team.drop_db
team.register_user

team2 = PlanitApp::TeamTest.new 'meena@gmail.com'
team2.register_user

#
# Register as a random user and do CRUD operations on Teams
#
team3 = PlanitApp::TeamTest.new
team3.register_user
team3.run

#
# Run tests as specific users
#
team.run
team2.run