require 'sinatra'
require 'json'

post '/teams' do
  status 201
  {
      "group": {
          "name": "Testing",
          "group_type": "Team",
          "users": [
              {
                  "uuid": "9bdd71c0-4bd7-0133-8a97-3ca82aa1a837",
                  "email": "dharsininitt@gmail.com"
              },
              {
                  "uuid": "50b0f360-4bcd-0133-8a97-3ca82aa1a837",
                  "email": "priyadharsini.nitt@gmail.com"
              }
          ]
      }
  }.to_json
end

get '/teams' do
  status 200
  {
      "groups": [
          {
              "id": "561daa837e692b488600000a",
              "uuid": "aedc62c0-543d-0133-5cad-2c87a30852bd",
              "name": "Test Group",
              "group_type": "Team",
              "users": [
                  {
                      "id": "561da37e7e692b40f0000004"
                  },
                  {
                      "id": "561da7c47e692b416d00000f"
                  }
              ]
          },
          {
              "id": "561daa837e692b488600000b",
              "uuid": "aee53d20-543d-0133-5cad-2c87a30852bd",
              "name": "Test Group",
              "group_type": "Team",
              "users": [
                  {
                      "id": "561da37e7e692b40f0000004"
                  },
                  {
                      "id": "561da59f7e692b40f0000019"
                  }
              ]
          },
          {
              "id": "561daa837e692b488600000c",
              "uuid": "aeeea240-543d-0133-5cad-2c87a30852bd",
              "name": "Test Group",
              "group_type": "Team",
              "users": [
                  {
                      "id": "561da37e7e692b40f0000004"
                  },
                  {
                      "id": "561da59f7e692b40f0000019"
                  }
              ]
          }
      ]
  }
end

get '/teams/:id' do
  status 200
  {
      "group": {
          "id": "561db1607e692b51ba00000a",
          "uuid": "c5f4a140-5441-0133-5cb0-2c87a30852bd",
          "name": "Test Group",
          "group_type": "Team",
          "users": [
              {
                  "id": "561da5737e692b40f0000014",
                  "uuid": "aa1c8af0-543a-0133-5caa-2c87a30852bd",
                  "email": "krish@gmail.com"
              },
              {
                  "id": "561da5b97e692b40f0000025",
                  "uuid": "d437f610-543a-0133-5caa-2c87a30852bd",
                  "email": "meena@gmail.com"
              }
          ]
      }
  }
end

delete '/teams/:id/users/:user_id' do
  status 204
end
