require 'sinatra'
require 'json'

post '/course-assessments' do
  status 201
  {
      "id": "55fa57592926e95bdc000005",
      "uuid": "89747ab0-3f2f-0133-bdd8-245e60b8e617",
      "course_assessment_name": "CA1",
      "course_assessment_type_name": "Assignment",
      "course_assessment_description": "CD1",
      "course_assessment_due_date": "09/13/2015 21:08 PM",
      "course_assessment_file_url": "http://localhost:9292/uploads/a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
      "course_assessment_file": "a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
      "current_user": "user@gmail.com"
  }.to_json
end

get '/course-assessments' do
  status 200
  {
      "course_assessments": [
          {
              "id": "55fa57592926e95bdc000005",
              "uuid": "89747ab0-3f2f-0133-bdd8-245e60b8e617",
              "course_assessment_name": "CA1",
              "course_assessment_type_name": "Assignment",
              "course_assessment_description": "CD1",
              "course_assessment_due_date": "09/13/2015 21:08 PM",
              "course_assessment_file_url": "http://localhost:9292/uploads/a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
              "course_assessment_file": "a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
              "modifier": {
                  "modified_on": "09/17/2015 11:32 AM"
              },
              "current_user": "user@gmail.com"
          }
      ]
  }.to_json
end

get '/course-assessments/:id' do
  status 200
  {
      "id": "55fa57592926e95bdc000005",
      "uuid": "89747ab0-3f2f-0133-bdd8-245e60b8e617",
      "course_assessment_name": "CA1",
      "course_assessment_type_name": "Assignment",
      "course_assessment_description": "CD1",
      "course_assessment_due_date": "09/13/2015 21:08 PM",
      "course_assessment_file_url": "http://localhost:9292/uploads/a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
      "course_assessment_file": "a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
      "modifier": {
          "modified_on": "09/17/2015 11:32 AM"
      },
      "current_user": "user@gmail.com"
  }.to_json
end

put '/course-assessments/:id' do
  status 200
  {
      "id": "55fa57592926e95bdc000005",
      "uuid": "89747ab0-3f2f-0133-bdd8-245e60b8e617",
      "course_assessment_name": "CA2",
      "course_assessment_type_name": "Assignment",
      "course_assessment_description": "CD1",
      "course_assessment_due_date": "09/13/2015 21:08 PM",
      "course_assessment_file_url": "http://localhost:9292/uploads/a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
      "course_assessment_file": "a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
      "modifier": {
          "modified_on": "09/17/2015 12:15 PM"
      },
      "current_user": '',
      "old_course_assessment_file_url": "http://localhost:9292/uploads/a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
      "old_course_assessment_file": "a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png"
  }.to_json
end

delete '/course-assessments/:id' do
  status 204
end

patch '/course-assessments/:id/users/:uuid/share' do
  status 200
end

patch '/course-assessments/:id/users/:uuid/unshare' do
  status 200
end

patch '/course-assessments/:id/groups/:uuid/share' do
  status 200
end

patch '/course-assessments/:id/groups/:uuid/unshare' do
  status 200
end

patch '/course-assessments/:id/users/:uuid/transfer-ownership' do
  status 200
end