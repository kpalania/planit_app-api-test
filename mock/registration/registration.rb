require 'sinatra'
require 'json'

post '/users/sign_up' do
  status 201
  {
      "group": {
          "name": "default",
          "users": [
              {
                  "email": "user1@gmail.com"
              }
          ]
      }
  }.to_json
end