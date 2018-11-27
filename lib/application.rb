require_relative '../config/config'
require_relative 'security/security'
require 'mongo'
require 'rest-client'
require 'faker'
require 'json'


module PlanitApp
  class Application
    def initialize email=EMAIL, api_token=API_TOKEN, expiration=EXPIRATION
      @email = email
      @api_token = api_token
      @expiration = expiration

      @app_auth_header = PlanitApp::Security.authorization_header "api_token=#{@api_token}"
      @user_auth_header = PlanitApp::Security.authorization_header "user=#{@email},expiration=#{@expiration}"

      @time = Time.now.strftime '%m/%d/%Y %l:%M %p'
    end

    #
    # Protected
    #
    protected

    def log_data url, method
      $logger.info "Method: #{method}, URL: #{url}"
    end

    def header_hash
      {:content_type => :json,
       'APP-AUTHORIZATION' => @app_auth_header,
       'USER-AUTHORIZATION' => @user_auth_header,
       params: {current_user: @email }}
    end

    def verify_resp_body id, name
      if id && name
        $logger.info '!! Test Passed for Body'
      else
        $logger.info '>> Test failed as username is empty'
      end
    end

    def verify_response_headers response_code
      if @res.code == response_code
        $logger.info '!! Test passed for headers'
        $logger.info "Response Code: #{response_code} #{RestClient::STATUSES[response_code]}"
        $logger.info "Response Body: #{@res.body}"
      else
        $logger.info '>> Test failed for headers'
        $logger.info "Expecting #{response_code} but result #{@res.code}"
      end
    end

  end
end