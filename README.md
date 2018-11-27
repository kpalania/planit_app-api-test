
FORMAT: 1A

# Snowpal: Planit-App API (Version 0.1)
Planit-App API includes a set of APIs that relate to the "Planit" Application.

# Group Change Tracker, Links and Notes

## Change Tracker

>| Date          |Author|Version Number| Changes           
>| ------------- |-------|--------------|-------------
>| 09/13/2015    |Krish Palaniappan| 0.1 |Initial Changes 

## Links

>[Project Management - Trello](https://trello.com)

>[API Request Documentation](https://docs.google.com/document/d/1vOt1Z7LDnBKcEvRQFoStY-gtaqy8DS8RCKHYB7tewh8)

## Notes

>1. API Token is encrypted using SymmetricEncryption (symmetric-encryption).
>2. Other authorization headers are encrypted using a dynamic IV.
>3. Every request needs to include 2 security related headers.

# Group Sign Up
Authentication related resources. The user can be authenticated either against Active Directory or against IdM with the RESTful URLs being specific to each of those.

The request needs to include a couple of security related headers. 
- APP-AUTHORIZATION: This validates that the request is actually coming from an application that is recognized. If it isn't, the request would fail without going any further.
- USER-AUTHORIZATION: This is the encrypted version of the user's credentials. An example of the unencrypted value might look like this: `'group=default,user=krish@gmail.com'`

The only group at this point is, `default`, but that will change in future.

## Register User [/users/sign_up]
### Sign up new user [POST]

### Request

**Required**

```
APP-AUTHORIZATION: (HTTP Header) Represents a request from a recognized UI client  
USER-AUTHORIZATION: (HTTP Header) Encrypted user information representing a user 
```

### Response

```
None other the response headers.
```

#### HTTP Response Status Codes
These are the possible HTTP Response Status Codes that would be returned by the API. 

```
200: Login was successful
401: Authentication failed
500: Internal Server Error (for instance, there was a bug in the code that resulted in an unhandled exception). There might be additional information about this error in the JSON response payload (TBD).
```

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 201 (application/json)

    + Headers
            
            Location: localhost/groups/b4626220-34ac-0133-fc3c-38f6b11c205b
            
    + Body
    
            {
              "group": {
                "name": "default",
                "users": [
                  {
                    "email": "user1@gmail.com"
                  }
                ]
              }
            }      
        
   
# Group Profile        
## Create Profile [/profiles]
### New Profile [POST]

### Request

**Required**

```
APP-AUTHORIZATION: (HTTP Header) Represents a request from a recognized UI client  
USER-AUTHORIZATION: (HTTP Header) Encrypted user information representing a user 
```

### Response

```
None other the response headers.
```
#### HTTP Response Status Codes
These are the possible HTTP Response Status Codes that would be returned by the API. 

```
201: User profile created
401: Authentication failed
403: forbidden 
500: Internal Server Error (for instance, there was a bug in the code that resulted in an unhandled exception). There might be additional information about this error in the JSON response payload (TBD).
```

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
              
+ Response 201 (application/json)

    + Headers
            
            Location: localhost/profiles/97bc0430-3dc9-0133-bdd8-245e60b8e617
        
    + Body 
       
            {
                "id": "97bc0430-3dc9-0133-bdd8-245e60b8e617",
                "uuid": "97bc0320-3dc9-0133-bdd8-245e60b8e617",
                "user_name": "kishore",
                "first_name": "User",
                "middle_name": "middle",
                "last_name": "last"
            }


### List All Profiles [GET]

**Required**

```
APP-AUTHORIZATION: (HTTP Header) Represents a request from a recognized UI client  
USER-AUTHORIZATION: (HTTP Header) Encrypted user information representing a user 
```
+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)
            
            
    + Body 
           
            {
              "profiles": [
               {
                 "id": "5c803f70-3d4f-0133-bdd6-245e60b8e617",
                 "uuid": "5c803e00-3d4f-0133-bdd6-245e60b8e617",
                 "user_name": "kishore",
                 "first_name": "Raparthi",
                 "middle_name": "Bala",
                 "last_name": "kishore"
               } ]
            }


## Get Profile [/profiles/:id]
### GET Profile [GET]

**Required**

```
APP-AUTHORIZATION: (HTTP Header) Represents a request from a recognized UI client  
USER-AUTHORIZATION: (HTTP Header) Encrypted user information representing a user 
```
+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)

    + Headers
            
            Location: localhost/profiles/97bc0430-3dc9-0133-bdd8-245e60b8e617
        
    + Body 
       
            {
                "id": "97bc0430-3dc9-0133-bdd8-245e60b8e617",
                "uuid": "97bc0320-3dc9-0133-bdd8-245e60b8e617",
                "user_name": "kishore",
                "first_name": "User",
                "middle_name": "middle",
                "last_name": "last"
            }
            
## Get Profile By Email [/profiles/user/krish@gmail.com]
### GET Profile By Email [GET]

**Required**

```
APP-AUTHORIZATION: (HTTP Header) Represents a request from a recognized UI client  
USER-AUTHORIZATION: (HTTP Header) Encrypted user information representing a user 
```
+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)

    + Headers
            
            Location: localhost/profiles/97bc0430-3dc9-0133-bdd8-245e60b8e617
        
    + Body 
       
            {
                "id": "97bc0430-3dc9-0133-bdd8-245e60b8e617",
                "uuid": "97bc0320-3dc9-0133-bdd8-245e60b8e617",
                "user_name": "kishore",
                "first_name": "User",
                "middle_name": "middle",
                "last_name": "last"
            }
            
### GET Profile [PUT]

```
204: No Header
401: Authentication failed
403: forbidden 
500: Internal Server Error (for instance, there was a bug in the code that resulted in an unhandled exception). There might be additional information about this error in the JSON response payload (TBD).
```
**Required**

```
APP-AUTHORIZATION: (HTTP Header) Represents a request from a recognized UI client  
USER-AUTHORIZATION: (HTTP Header) Encrypted user information representing a user 
profile[user_name]: User name must be uniqe 
profile[first_name] first name of the profile
profile[middle_name] middle name  of the profile
profile[last_name]  last name of the profile
```
+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
    + Body 
       
            profile[user_name]=kishore&
            profile[first_name]=FIRST&
            profile[middle_name]=MIDDLE&
            profile[last_name]=LAST

+ Response 204
    
    + Headers
        
            Location: localhost/profiles/97bc0430-3dc9-0133-bdd8-245e60b8e617



# Group Courses
## New Course  [/courses]
### Create New Course [POST]

**Required**

```
APP-AUTHORIZATION: (HTTP Header) Represents a request from a recognized UI client  
USER-AUTHORIZATION: (HTTP Header) Encrypted user information representing a user 
```

```
201: Course created
401: Authentication failed
403: forbidden 
500: Internal Server Error (for instance, there was a bug in the code that resulted in an unhandled exception). There might be additional information about this error in the JSON response payload (TBD).
```

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
    + Body
            
            course[course_description] = Cdescription1&
            course[course_type_name] = Advanced Placement&
            course[course_id] = C1&
            course[course_name] = CName1&
            course[course_start_time] = 09/13/2015 3:19 PM&
            course[course_end_time] = 09/26/2015 20:49 PM&
            course[course_file_url]=http://localhost:9292/uploads/0438a81f-9552-46dc-90fa-fb35a9f963c0.png&
            course[course_file] = 0438a81f-9552-46dc-90fa-fb35a9f963c0.png


+ Response 201 (application/json)

    + Body 
            
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

### List All Courses [GET]

+ Request

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)

    + Body 
            
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
            }


## Course [/courses/:id]
### Show Course [GET]


+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
                
+ Response 200 (application/json)

    + Body

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
            }

### Update Course [PUT]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
             
    + Body 
    
            course[course_description] = Cdescription1&
            course[course_type_name] = Advanced Placement&
            course[course_id] = C1&
            course[course_name] = CName1&
            course[course_start_time] = 09/13/2015 3:19 PM&
            course[course_end_time] = 09/26/2015 20:49 PM&
            course[course_file_url]=http://localhost:9292/uploads/0438a81f-9552-46dc-90fa-fb35a9f963c0.png&
            course[course_file] = 0438a81f-9552-46dc-90fa-fb35a9f963c0.png

+ Response 200 (application/json)

    + Body
    
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
                "current_user": null,
                "old_course_file_url": "http://localhost:9292/uploads/0438a81f-9552-46dc-90fa-fb35a9f963c0.png",
                "old_course_file": "438a81f-9552-46dc-90fa-fb35a9f963c0.png"
            }


### Delete Course [DELETE]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 204

## Share Course [/courses/:id/users/:uuid/share]
### Share Course with user [PATCH]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
             
    + Body 

+ Response 200 (application/json)

## Unshare Course [/courses/:id/users/:uuid/unshare]
### Unshare Course with user [PATCH]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
             
    + Body 

+ Response 200 (application/json)

## Share Course [/courses/:id/groups/:uuid/share]
### Share Course with group [PATCH]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
             
    + Body 

+ Response 200 (application/json)

## Unshare Course [/courses/:id/groups/:uuid/unshare]
### Unshare Course with group [PATCH]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
             
    + Body 

+ Response 200 (application/json)

## Course File Delete [/courses/:id/files/delete/:id]
### Delete  File [PATCH]


+ Request

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 204

# Group Course Types
## Course Types [/course-types]
### Different types of courses [GET]


+ Request

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)
    
    + Body
    
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
                            "mapped_uuid": null,
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
                            "mapped_uuid": null,
                            "uuid": "a421d820-3dc7-0133-bdd6-245e60b8e617"
                        }
                    }]
                
                }
             

# Group Course Assessments
## New Course Assessment [/course_assessment]
### Create a new Course Assessment [POST]

**REQUIRED**

```
 HEADERS
     APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
     USER-AUTHORIZATION: afcfb67efb2747d54c9d32632091d2711911af83
 
 BODY
     course_assessment[course_assessment_description] = CD1&
     course_assessment[course_assessment_type_name] = Assignment&
     course_assessment[course_assessment_name]=CA1&
     course_assessment[course_assessment_due_date]=09/13/2015 3:38 PM
     course_assessment[course_assessment_file_url]=http://localhost:9292/uploads/a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png&
     course_assessment[course_assessment_file]=a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png
     current_user = User@gmail.com
```

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
    + Body
       
            course_assessment[course_assessment_description] = CD1&
            course_assessment[course_assessment_type_name] = Assignment&
            course_assessment[course_assessment_name]=CA1&
            course_assessment[course_assessment_due_date]=09/13/2015 3:38 PM
            course_assessment[course_assessment_file_url]=http://localhost:9292/uploads/a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png&
            course_assessment[course_assessment_file]=a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png
            current_user = User@gmail.com
    
+ Response 201 (application/json)

    + Body

            {
                "id": "55fa57592926e95bdc000005",
                "uuid": "89747ab0-3f2f-0133-bdd8-245e60b8e617",
                "course_assessment_name": "CA1",
                "course_assessment_type_name": "Assignment",
                "course_assessment_description": "CD1",
                "course_assessment_due_date": "09/13/2015 21:08 PM",
                "course_assessment_file_url": "http://localhost:9292/uploads/a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
                "course_assessment_file": "a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
                "current_user": user@gmail.com
            }       


### List All Course Assessment [GET]

+ Request 
  
    + Headers

            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)

    + Body

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
                        "current_user": user@gmail.com
                    }
                ]
            }
            
## Course Assessment [/course_assessment/:id]
### Show Course Assessment [GET]

+ Request 
    
    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)

    + Body

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
                    "current_user": user@gmail.com
            }
            
            
### Update Course Assessment [PUT]

+ Request 
    
    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)

    + Body

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
                "current_user": null,
                "old_course_assessment_file_url": "http://localhost:9292/uploads/a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png",
                "old_course_assessment_file": "a6b5e855-13f1-4c03-9a9d-3b2f572a403e.png"
            }
            

### Delete Course Assessment [DELETE]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 204


## Share Course Assessment [/course-assessments/:id/users/:uuid/share]
### Share Course Assessmet with user [PATCH]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
             
    + Body 

+ Response 200 (application/json)

## Unshare Course Assessment [/course-assessments/:id/users/:uuid/unshare]
### Unshare Course Assessment with user [PATCH]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
             
    + Body 

+ Response 200 (application/json)

## Share Course Assessment [/course-assessments/:id/groups/:uuid/share]
### Share Course Assessment with group [PATCH]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
             
    + Body 

+ Response 200 (application/json)

## Unshare Course Assessment [/course-assessments/:id/groups/:uuid/unshare]
### Unshare Course Assessment with group [PATCH]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
             
    + Body 

+ Response 200 (application/json)

## Course File Delete [/course_assessment/:id/files/delete/:id]
### Delete  File [PATCH]


+ Request

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 204

## Course Assessment Ownership [/course-assessments/:id/users/:uuid/transfer-ownership]
### Course Assessment transfer ownership to user [PATCH]
+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
             
    + Body 

+ Response 200 (application/json)


# Group Course Assessment Types
## Course Assessment Types Collection [/course-assessment-types]
### List All Assessment Types [GET]

+ Request

    + Headers

            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)

    + Body
    
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
                            "mapped_uuid": null,
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
                            "mapped_uuid": null,
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
                            "mapped_uuid": null,
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
                            "mapped_uuid": null,
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
                            "mapped_uuid": null,
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
                            "mapped_uuid": null,
                            "uuid": "a421d820-3dc7-0133-bdd6-245e60b8e617"
                        }
                    }
                ]
            }
            
Group Schools
##  School Collection [/schools]
### List All schools [GET]

**REQUIRED**

```
 HEADERS
     APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
     USER-AUTHORIZATION: afcfb67efb2747d54c9d32632091d2711911af83
```

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
  
    
+ Response 200 (application/json)

    + Body

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
                        "institution_name": abc,
                        "website": "http://abc.com",
                        "address": "aabaksa,assda,asdas",
                        "phone_number": "2343546456",
                        "course_ids": []
                      }  ]
            }     

## Create A School [/schools]
### New School [POST]

+ Request 
  
    + Headers

            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
    
    + Body
        
            school[institution_name] = LBC &
            school[website] = http://xyz.com &
            school[address] = Abc Street, vizag
            school[phone_number] = 9523445342

+ Response 201 (application/json)

    + Body

            {
                "id": "560ad3ad2926e9f357000000",
                "uuid": "0c8e5f00-4903-0133-2678-245e60b8e617",
                "institution_name": "Nalanda",
                "website": "http://docs.mongodb.org/ecosystem/tutorial/ruby-mongoid-tutorial/",
                "address": "aabaksa,assda,asdas",
                "phone_number": "2343546456",
                "course_ids": []
            }
            
##  School [/schools/:id]
### Show school [GET]

+ Request 
    
    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)

    + Body

            {
                "id": "560ad3ad2926e9f357000000",
                "uuid": "0c8e5f00-4903-0133-2678-245e60b8e617",
                "institution_name": "Nalanda",
                "website": "http://docs.mongodb.org/ecosystem/tutorial/ruby-mongoid-tutorial/",
                "address": "aabaksa,assda,asdas",
                "phone_number": "2343546456",
                "course_ids": []
            }
            
            
### Update School [PUT]

+ Request 
    
    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)

+ Request 
  
    + Headers

            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
    
    + Body
        
            school[institution_name] = Nalanda &
            school[website] = http://docs.mongodb.org/ecosystem/tutorial/ruby-mongoid-tutorial &
            school[address] = Abc Street, vizag
            school[phone_number] = 9523445342

+ Response 200 (application/json)

    + Body

            {
                "id": "560ad3ad2926e9f357000000",
                "uuid": "0c8e5f00-4903-0133-2678-245e60b8e617",
                "institution_name": "Nalanda11",
                "website": "http://docs.mongodb.org/ecosystem/tutorial/ruby-mongoid-tutorial/",
                "address": "Abc Street, vizag",
                "phone_number": "2343546456",
                "course_ids": []
            }


### Delete School [DELETE]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 204

# Group Tasks
##  Task Collection [/tasks]
### List All Tasks [GET]

**REQUIRED**

```
 HEADERS
     APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
     USER-AUTHORIZATION: afcfb67efb2747d54c9d32632091d2711911af83
```

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
  
    
+ Response 200 (application/json)

    + Body

            {
                "tasks": [
                    {
                        "id": "560a07d82926e9edfb000000",
                        "uuid": "8e3694b0-4889-0133-2672-245e60b8e617",
                        "type": "Home Work",
                        "description": null,
                        "due_date": "09/30/2015 12:35 PM"
                    },
                    {
                        "id": "560a08bd2926e9ee16000000",
                        "uuid": "1681d990-488a-0133-2673-245e60b8e617",
                        "type": "Home Work",
                        "description": "sdasdkas dfdsfds",
                        "due_date": "09/30/2015 12:35 PM"
                    },
                    {
                        "id": "560ab9322926e9f0bf000002",
                        "uuid": "43b7ef80-48f3-0133-2674-245e60b8e617",
                        "type": "Home Work",
                        "description": "sdasdkas dfdsfds",
                        "due_date": "09/30/2015 12:35 PM"
                    },
                    {
                        "id": "560aba332926e9f0bf000005",
                        "uuid": "dd2f7a20-48f3-0133-2674-245e60b8e617",
                        "type": "Loy",
                        "description": "Krystina Harvey MD",
                        "due_date": "09/29/2015  9:50 PM"
                    }
                ]
            }
## Create A Task [/tasks]
### New Task [POST]

+ Request 
  
    + Headers

            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
    
    + Body
        
            task[type] = Loy &
            task[description] = Krystina Harvey MD &
            task[due_date] = 09/30/2015 12:35 PM
            

+ Response 201 (application/json)

    + Body

            {
                "id": "560aba332926e9f0bf000005",
                "uuid": "dd2f7a20-48f3-0133-2674-245e60b8e617",
                "name": 'Xyz',
                "type": "Loy",
                "description": "Krystina Harvey MD",
                "due_date": "09/29/2015  9:50 PM"
            }
            
## Task [/tasks/:id]
### Show Task [GET]

+ Request 
    
    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)

    + Body

            {
                "id": "560aba332926e9f0bf000005",
                "uuid": "dd2f7a20-48f3-0133-2674-245e60b8e617",
                "type": "Loy",
                "name": "XYZ",
                "description": "Krystina Harvey MD",
                "due_date": "09/29/2015  9:50 PM"
            }
            
            
### Update Task [PUT]

+ Request 
    
    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 200 (application/json)

+ Request 
  
    + Headers

            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
    
    + Body
        
            task[type] = Loy &
            task[description] = Krystina Harvey MD &
            task[due_date] = 09/30/2015 12:35 PM

+ Response 200 (application/json)

    + Body

            {
                "id": "560aba332926e9f0bf000005",
                "uuid": "dd2f7a20-48f3-0133-2674-245e60b8e617",
                "type": "Loy",
                "name": "XYZ",
                "description": "Krystina Harvey MD",
                "due_date": "09/29/2015  9:50 PM"
            }


### Delete Task [DELETE]

+ Request 

    + Headers
            
            APP-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            USER-AUTHORIZATION: iv=%EA%92%FA%1D%D85%99%29Y%E4%EC%D0%A9gO%E8,value=%B8%BE%1Cl%3B%B4%0B%F7%CC%A6%9Dr%B8%B0F%F1
            
+ Response 204

