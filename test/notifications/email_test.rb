require_relative '../application_test'

module PlanitApp
  class EmailTest < ApplicationTest
    def run
      $logger.debug '..Send Email'
      @mail.create
    end
  end
end

#
# Register as a random user and do send email
#
mail = PlanitApp::EmailTest.new
mail.register_user
mail.run

#
# Register as a specific user
#
registered_email = 'krish@gmail.com'
mail = PlanitApp::EmailTest.new registered_email
mail.register_user
mail.run

# #
# # Send Email as a previously registered user
# #
# mail = PlanitApp::EmailTest.new registered_email
# mail.run


