require 'sinatra'
require 'json'
require 'logger'
require 'puma'

require_relative '../config/config'
require_relative 'registration/registration'
require_relative 'profile'
require_relative 'course/course'
require_relative 'course/course_type'
require_relative 'course/course_assessment'
require_relative 'course/course_assessment_type'
require_relative 'school/school'
require_relative 'task/task'

$mock_logger = Logger.new PlanitApp::MOCK_LOG_FILE

set :port, 9293

before '/*' do
  $mock_logger.info JSON.pretty_generate(request.env)
  content_type :json
end

#
# Run the script as below and change the port in config/config.yml to point to it.
#
# $ruby mock_api.rb
#

