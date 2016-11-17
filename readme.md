# Lapis Personalization API

A simple Web Service for creating and serving personalized content for logged in users based on the group the logged in user belongs to.

The project aims to have multi site, multi group support along with specific page positions for content.  A flexible store for user profiles is also provided.

Uses Postgres Database.

## Config Setting

Set the following:
  
* config.session_cookie ( the name of your session cookie for your application )
* config.load_user ( the function that will load the user )
* config.redirect_url ( the login url for your application )

## User Service

```bash
# Create User
curl -H "Content-Type: application/json" -X POST -d '{"username": "Funny Guy"}' http://127.0.0.1:8080
# Find User by Username
curl -H "Content-Type: application/json"  -X POST -d '{"username": "Funny Guy"}' http://127.0.0.1:8080/user/search
# Update User
curl -H "Content-Type: application/json"  -X PUT -d '{"username": "Funny Guy.2", "id":1}' http://127.0.0.1:8080/user
# Delete User
curl -H "Content-Type: application/json"  -X DELETE http://127.0.0.1:8080/user/1
```

## Profile Service

Extended user profile data.

## Position Service

The position on a web page where content appears eg sidebar or footer or header

## Site Service

The domain/url of the site for which the content belongs.

## Parent Service

The parent name of the page to which the content is served on.

## Content Service

The personalised content.
