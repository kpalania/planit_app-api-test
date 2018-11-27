require 'sinatra'
require 'json'

post '/tasks' do
  status 201
  {
      "id": "560aba332926e9f0bf000005",
      "uuid": "dd2f7a20-48f3-0133-2674-245e60b8e617",
      "type": "Loy",
      "name": "XYZ",
      "description": "Krystina Harvey MD",
      "due_date": "09/29/2015  9:50 PM"
  }.to_json
end

get '/tasks' do
  status 200
  {
      "tasks": [
          {
              "id": "560aba332926e9f0bf000005",
              "uuid": "dd2f7a20-48f3-0133-2674-245e60b8e617",
              "type": "Loy",
              "name": "XYZ",
              "description": "Krystina Harvey MD",
              "due_date": "09/29/2015  9:50 PM"
          },
          {
              "id": "560aba332926e9f0bf000005",
              "uuid": "dd2f7a20-48f3-0133-2674-245e60b8e617",
              "type": "Loy1",
              "name": "XYZ1",
              "description": "Krystina Harvey MD1",
              "due_date": "09/29/2015  9:50 PM"
          }  ]
  }.to_json
end

get '/tasks/:id' do
  status 200
  {        "id": "560aba332926e9f0bf000005",
           "uuid": "dd2f7a20-48f3-0133-2674-245e60b8e617",
           "type": "Loy",
           "name": "XYZ",
           "description": "Krystina Harvey MD",
           "due_date": "09/29/2015  9:50 PM"
  }.to_json
end

put '/tasks/:id' do
  status 200
  {
      "id": "560aba332926e9f0bf000005",
      "uuid": "dd2f7a20-48f3-0133-2674-245e60b8e617",
      "type": "Loy",
      "name": "XYZ",
      "description": "Krystina Harvey MD",
      "due_date": "09/29/2015  9:50 PM"
  }.to_json
end

delete '/tasks/:id' do
  status 204
end