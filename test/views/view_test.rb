require_relative '../application_test'

module PlanitApp
  class ViewTest < ApplicationTest
    def run
      $logger.debug '..Create view'
      @view.create

      $logger.debug '..Show View'
      @view.show

      $logger.debug '..Update view'
      @view.update

      $logger.debug '..List views'
      @view.index


    end
  end
end

#
# Register as a random user and do CRUD operations on views
#
view = PlanitApp::ViewTest.new
view.drop_db
view.register_user
view.run

#
# Register as a specific user
#
registered_email = 'krish@gmail.com'
view = PlanitApp::ViewTest.new registered_email
view.register_user
view.run

#
# Create view as a previously registered user
#
view = PlanitApp::ViewTest.new registered_email
view.run


