require_relative '../application'

module PlanitApp
  class CourseAssessmentShare < CourseAssessment

    def share_with_user user_email
      @res = RestClient.patch "#{url(@json_data['id'])}/users/#{get_user_uuid user_email}/share", '', header_hash
      log_data url, 'PATCH'
      verify_response_headers 200
    end

    def unshare_from_user user_email
      @res = RestClient.patch "#{url(@json_data['id'])}/users/#{get_user_uuid user_email}/unshare?clone=true", '', header_hash
      log_data url, 'PATCH'
      verify_response_headers 200
    end

    def share_with_team
      @res = RestClient.patch "#{url(@json_data['id'])}/teams/#{get_team_uuid}/share", '', header_hash
      log_data url, 'PATCH'
      verify_response_headers 200
    end

    def unshare_from_team
      @res = RestClient.patch "#{url(@json_data['id'])}/teams/#{get_team_uuid}/unshare", '', header_hash
      log_data url, 'PATCH'
      verify_response_headers 200
    end

    def transfer_owner_ship user_email
      @res = RestClient.patch "#{url(@json_data['id'])}/users/#{get_user_uuid user_email}/transfer-ownership", '', header_hash
      log_data url, 'PATCH'
      verify_response_headers 200
    end

    #
    # Private
    #
    private

    def get_team_uuid
      teams_res = RestClient.get "#{URL}/teams", header_hash
      teams = JSON.parse teams_res.body
      teams["teams"].first["uuid"]
    end

    def get_user_uuid user_email
      response = RestClient.get "#{URL}/users/#{user_email}", header_hash
      user = JSON.parse response.body
      user['user']['uuid']
    end
  end
end

