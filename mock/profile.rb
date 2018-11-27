require 'sinatra'
require 'json'

post '/profiles' do
  status 201
  {
      "id" => "97bc0430-3dc9-0133-bdd8-245e60b8e617",
      "uuid" => "97bc0320-3dc9-0133-bdd8-245e60b8e617",
      "user_name" => "user",
      "first_name" => "User",
      "middle_name" => "middle",
      "last_name" => "last"
  }.to_json
end

get '/profiles' do
  status 200
  {
      "profiles": [
          {
              "id": "5c803f70-3d4f-0133-bdd6-245e60b8e617",
              "uuid": "5c803e00-3d4f-0133-bdd6-245e60b8e617",
              "user_name": "user",
              "first_name": "Raparthi",
              "middle_name": "Bala",
              "last_name": "user"
          } ]
  }.to_json
end

get '/profiles/:id' do
  status 200
  {
      "id" => "97bc0430-3dc9-0133-bdd8-245e60b8e617",
      "uuid" => "97bc0320-3dc9-0133-bdd8-245e60b8e617",
      "user_name" => "user",
      "first_name" => "User",
      "middle_name" => "middle",
      "last_name" => "last"
  }.to_json
end

put '/profiles/:id' do
  status 200
  {
      "id" => "97bc0430-3dc9-0133-bdd8-245e60b8e617",
      "uuid" => "97bc0320-3dc9-0133-bdd8-245e60b8e617",
      "user_name" => "user",
      "first_name" => "User",
      "middle_name" => "middle",
      "last_name" => "last"
  }.to_json
end

delete '/profiles/:id' do
  status 204
end