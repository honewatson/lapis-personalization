# User
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
