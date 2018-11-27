require 'sinatra'
require 'json'

post '/course-assessment-types' do
  status 201
  {
      "id": {
          "$oid": "5600d08b2926e9c13e000000"
      },
      "course_assessment_types": [
          {
              "course_assessment_type": {
                  "_id": {
                      "$oid": "56019afe2926e9ca77000001"
                  },
                  "course_assessment_type_name": "Fb",
                  "uuid": "f8c703b0-4383-0133-f931-245e60b8e617"
              }
          }
      ]
  }.to_json
end

get '/course-assessment-types' do
  status 200
  {
      "course_assessment_types": [
          {
              "course_assessment_type": "Assignment",
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
              "course_assessment_type": "Exam",
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
              "course_assessment_type": "Home Work",
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
              "course_assessment_type": "Project",
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
                  "mapped_uuid": "null",
                  "uuid": "a421d820-3dc7-0133-bdd6-245e60b8e617"
              }
          },
          {
              "course_assessment_type": "Quiz",
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
                  "mapped_uuid": "null",
                  "uuid": "a421d820-3dc7-0133-bdd6-245e60b8e617"
              }
          },
          {
              "course_assessment_type": "Test",
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
          }
      ]
  }.to_json
end
