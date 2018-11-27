require 'sinatra'
require 'json'

post '/grades' do
  status 201
  {
      "id": "560f9dce79e68b38a5000000",
      "uuid": "e12098c0-4bdd-0133-8a98-3ca82aa1a837",
      "points_scored": "A+",
      "current_user": "krish@gmail.com"
  }.to_json
end

get '/grades' do
  status 200
  {
  "grades": [
    {
      "id": "560f857779e68b34c4000003",
      "uuid": "5f1bc970-4bcf-0133-8a97-3ca82aa1a837",
      "points_scored": "A+",
      "current_user": {
        "_id": {
          "$oid": "560f853379e68b34c4000002"
        },
        "email": "krish@gmail.com",
        "group_ids": [
          {
            "$oid": "560f820479e68b34c4000001"
          }
        ],
        "mapped_uuid": null,
        "uuid": "367bdad0-4bcf-0133-8a97-3ca82aa1a837"
      }
    },
    {
      "id": "560f9cb379e68b34c4000005",
      "uuid": "38414d70-4bdd-0133-8a97-3ca82aa1a837",
      "points_scored": "B",
      "current_user": {
        "_id": {
          "$oid": "560f853379e68b34c4000002"
        },
        "email": "krish@gmail.com",
        "group_ids": [
          {
            "$oid": "560f820479e68b34c4000001"
          }
        ],
        "mapped_uuid": null,
        "uuid": "367bdad0-4bcf-0133-8a97-3ca82aa1a837"
      }
    }
  ]
}.to_json
end

get '/grades/:id' do
  status 200
  {
  "id": "560f9cb379e68b34c4000005",
  "uuid": "38414d70-4bdd-0133-8a97-3ca82aa1a837",
  "points_scored": "B",
  "current_user": {
    "_id": {
      "$oid": "560f853379e68b34c4000002"
    },
    "email": "krish@gmail.com",
    "group_ids": [
      {
        "$oid": "560f820479e68b34c4000001"
      }
    ],
    "mapped_uuid": null,
    "uuid": "367bdad0-4bcf-0133-8a97-3ca82aa1a837"
  }
}.to_json
end

put '/grades/:id' do
  status 200
  {
      "id": "560f9cb379e68b34c4000005",
      "uuid": "38414d70-4bdd-0133-8a97-3ca82aa1a837",
      "points_scored": "B+",
      "current_user": 'krish@gmail.com'
  }.to_json
end

delete '/grades/:id' do
  status 204
end
