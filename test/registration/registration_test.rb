require_relative '../application_test'

module PlanitApp
  class RegistrationTest < ApplicationTest
  end
end

#
# Register as a random user
#
register = PlanitApp::RegistrationTest.new
register.drop_db
register.register_user

#
# Register as a specific user
#
register = PlanitApp::RegistrationTest.new 'krish@gmail.com'
register.register_user