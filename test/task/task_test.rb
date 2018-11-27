require_relative '../application_test'

module PlanitApp
  class TaskTest < ApplicationTest
    def run
      $logger.debug '..Create Task'
      @task.create

      $logger.debug '..Show Task'
      @task.show

      $logger.debug '..Update Task'
      @task.update

      $logger.debug '..List Tasks'
      @task.index

      $logger.debug '..Delete Task'
     # @task.destroy
    end
  end
end

#
# Register as a random user and do CRUD operations on Tasks
#
task = PlanitApp::TaskTest.new
task.drop_db
task.register_user
task.run

#
# Register as a specific user
#
registered_email = 'krish@gmail.com'
task = PlanitApp::TaskTest.new registered_email
task.register_user
task.run



