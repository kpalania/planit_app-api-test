require_relative '../application_test'

module PlanitApp
  class SmsTest < ApplicationTest
    def run
      $logger.debug '..Send SMS'
      @sms.create
    end
  end
end

#
# Register as a random user and do send sms
#
sms = PlanitApp::SmsTest.new
sms.register_user
sms.run

#
# Register as a specific user
#
registered_email = 'krish@gmail.com'
sms = PlanitApp::SmsTest.new registered_email
sms.register_user
sms.run

#
# Send SMS as a previously registered user
#
sms = PlanitApp::SmsTest.new registered_email
sms.run


