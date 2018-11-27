require 'sinatra'
require 'json'

post '/schools' do
  status 201
  {
      "id": "5609fbbc2926e9ed46000000",
      "uuid": "56521140-4882-0133-266c-245e60b8e617",
      "institution_name": "XYZ",
      "website": "http://xyz.com",
      "address": "aabaksa,assda,asdas",
      "phone_number": "2343546456",
      "course_ids": []
  }.to_json
end

get '/schools' do
  status 200
  {
      "schools": [
          {
              "id": "5609fbbc2926e9ed46000000",
              "uuid": "56521140-4882-0133-266c-245e60b8e617",
              "institution_name": "XYZ",
              "website": "http://xyz.com",
              "address": "aabaksa,assda,asdas",
              "phone_number": "2343546456",
              "course_ids": []
          },
          {
              "id": "560a03ad2926e9eda1000000",
              "uuid": "11ec4800-4887-0133-266d-245e60b8e617",
              "institution_name": "abc",
              "website": "http://abc.com",
              "address": "aabaksa,assda,asdas",
              "phone_number": "2343546456",
              "course_ids": []
          }  ]
  }.to_json
end

get '/schools/:id' do
  status 200
  {      "id": "5609fbbc2926e9ed46000000",
         "uuid": "56521140-4882-0133-266c-245e60b8e617",
         "institution_name": "XYZ",
         "website": "http://xyz.com",
         "address": "aabaksa,assda,asdas",
         "phone_number": "2343546456",
         "course_ids": []
  }.to_json
end

put '/schools/:id' do
  status 200
  {
      "id": "5609fbbc2926e9ed46000000",
      "uuid": "56521140-4882-0133-266c-245e60b8e617",
      "institution_name": "abc",
      "website": "http://abc.com",
      "address": "aabaksa,assda,asdas",
      "phone_number": "2343546456",
      "course_ids": []
  }.to_json
end

delete '/schools/:id' do
  status 204
end