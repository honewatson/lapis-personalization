config = require "lapis.config"

config "development", ->
  postgres ->
    host "127.0.0.1"
    user "username"
    password ""
    database "personalisation"
