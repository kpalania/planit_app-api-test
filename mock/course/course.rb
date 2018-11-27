require 'sinatra'
require 'json'

post '/courses' do
  status 201
  {
      "id": "55f99f072926e95bdc000001",
      "uuid": "ac3a1380-3ec1-0133-bdd8-245e60b8e617",
      "course_id": "C1",
      "course_name": "CName1",
      "course_type_name": "Advanced Placement",
      "course_description": "Cdescription1",
      "course_start_time": "09/13/2015 20:49 PM",
      "course_end_time": "09/26/2015 20:49 PM",
      "course_file_url": "http://localhost:9292/uploads/0438a81f-9552-46dc-90fa-fb35a9f963c0.png",
      "course_file": "0438a81f-9552-46dc-90fa-fb35a9f963c0.png",
      "modifier": {
          "modified_on": "09/16/2015 22:25 PM"
      }
  }.to_json
end

get '/courses' do
  status 200
  {
      "courses": [
          {
              "id": "55f99f072926e95bdc000001",
              "uuid": "ac3a1380-3ec1-0133-bdd8-245e60b8e617",
              "course_id": "C1",
              "course_name": "CName1",
              "course_type_name": "Advanced Placement",
              "course_description": "Cdescription1",
              "course_start_time": "09/13/2015 20:49 PM",
              "course_end_time": "09/26/2015 20:49 PM",
              "course_file_url": "http://localhost:9292/uploads/0438a81f-9552-46dc-90fa-fb35a9f963c0.png",
              "course_file": "0438a81f-9552-46dc-90fa-fb35a9f963c0.png",
              "modifier": {
                  "modified_on": "09/16/2015 22:25 PM"
              }
          }
      ]
  }.to_json
end

get '/courses/:id' do
  status 200
  {
      "id": "55f9a79f2926e95bdc000004",
      "uuid": "cbca52e0-3ec6-0133-bdd8-245e60b8e617",
      "course_id": "C1",
      "course_name": "CName1",
      "course_type_name": "Advanced Placement",
      "course_description": "Cdescription1",
      "course_start_time": "09/13/2015 20:49 PM",
      "course_end_time": "09/26/2015 20:49 PM",
      "course_file_url": "http://localhost:9292/uploads/0438a81f-9552-46dc-90fa-fb35a9f963c0.png",
      "course_file": "0438a81f-9552-46dc-90fa-fb35a9f963c0.png",
      "modifier": {
          "modified_on": "09/16/2015 23:02 PM"
      }
  }.to_json
end

put '/courses/:id' do
  status 200
  {
      "id": "55f99ef02926e95bdc000000",
      "uuid": "9f051be0-3ec1-0133-bdd8-245e60b8e617",
      "course_id": "C1",
      "course_name": "CName1",
      "course_type_name": "Advanced Placement",
      "course_description": "Cdescription2",
      "course_start_time": "09/13/2015 20:49 PM",
      "course_end_time": "09/27/2015 02:19 AM",
      "course_file_url": "http://localhost:9292/uploads/0438a81f-9552-46dc-90fa-fb35a9f963c0.png",
      "course_file": "0438a81f-9552-46dc-90fa-fb35a9f963c0.png",
      "modifier": {
          "modified_on": "09/16/2015 23:39 PM"
      },
      "current_user": '',
      "old_course_file_url": "http://localhost:9292/uploads/0438a81f-9552-46dc-90fa-fb35a9f963c0.png",
      "old_course_file": "438a81f-9552-46dc-90fa-fb35a9f963c0.png"
  }.to_json
end

delete '/courses/:id' do
  status 204
end

patch '/courses/:id/users/:uuid/share' do
  status 200
end

patch '/courses/:id/users/:uuid/unshare' do
  status 200
end

patch '/courses/:id/groups/:uuid/share' do
  status 200
end

patch '/courses/:id/groups/:uuid/unshare' do
  status 200
end