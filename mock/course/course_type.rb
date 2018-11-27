require 'sinatra'
require 'json'

post '/course-types' do
  status 201
  {
      "id": "5600d08b2926e9c13e000000",
      "course_types": [
          {
              "course_type": {
                  "_id": {
                      "$oid": "560198612926e9ca77000000"
                  },
                  "course_type_name": "Physics",
                  "uuid": "6a2f7070-4382-0133-f931-245e60b8e617"
              }
          }
      ]
  }.to_json
end

get '/course-types' do
    status 200
  {
      "course_types": [
          {
              "course_type": "Advanced Placement",
              "current_user": {
                  "_id": {
                      "$oid": "55f7fb8b2926e958de000002"
                  },
                  "email": "user@gmail.com",
                  "group_ids": [
                      {
                          "$oid": "55f5adbe2926e94467000001"
                      }
                  ],
                  "mapped_uuid": "a421d820-3dc7-0133-bdd6-245e60b8e616",
                  "uuid": "a421d820-3dc7-0133-bdd6-245e60b8e617"
              }
          },
          {
              "course_type": "Basic",
              "current_user": {
                  "_id": {
                      "$oid": "55f7fb8b2926e958de000002"
                  },
                  "email": "user@gmail.com",
                  "group_ids": [
                      {
                          "$oid": "55f5adbe2926e94467000001"
                      }
                  ],
                  "mapped_uuid": 'a421d820-3dc7-0133-bdd6-245e60b8e616',
                  "uuid": "a421d820-3dc7-0133-bdd6-245e60b8e617"
              }
          }]
  }.to_json
end
