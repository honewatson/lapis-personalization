local lapis = require("lapis")
local json_params, capture_errors_json, respond_to
do
  local _obj_0 = require("lapis.application")
  json_params, capture_errors_json, respond_to = _obj_0.json_params, _obj_0.capture_errors_json, _obj_0.respond_to
end
local Model
do
  local _obj_0 = require("lapis.db.model")
  Model = _obj_0.Model
end
local assert_valid
do
  local _obj_0 = require("lapis.validate")
  assert_valid = _obj_0.assert_valid
end
local slugify, to_json, from_json
do
  local _obj_0 = require("lapis.util")
  slugify, to_json, from_json = _obj_0.slugify, _obj_0.to_json, _obj_0.from_json
end
local config = require("lapis.config").get()
local db = require("lapis.db")
local User
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "User",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  User = _class_0
end
local ProfileJson
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "ProfileJson",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  self.primary_key = 'user_id'
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  ProfileJson = _class_0
end
local Parent
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Parent",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Parent = _class_0
end
local Site
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Site",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Site = _class_0
end
local Group
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Group",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Group = _class_0
end
local Position
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Position",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Position = _class_0
end
local Content
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "Content",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  Content = _class_0
end
local ContentJson
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "ContentJson",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  self.primary_key = 'content_id'
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  ContentJson = _class_0
end
local UserGroupIndex
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "UserGroupIndex",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  self.primary_key = {
    'user_id',
    'group_id'
  }
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  UserGroupIndex = _class_0
end
local GroupContentIndex
do
  local _parent_0 = Model
  local _base_0 = { }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = "GroupContentIndex",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  self.primary_key = {
    'group_id',
    'content_id'
  }
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  GroupContentIndex = _class_0
end
local success
success = function()
  return {
    message = "Success!"
  }
end
local not_found
not_found = function(name)
  return {
    message = tostring(name) .. " not found!"
  }
end
local create
create = function(create_inst, params, unique, asserts)
  return respond_to({
    POST = capture_errors_json(json_params(function(self)
      assert_valid(params, asserts)
      local ok, inst = pcall(create)
      if type(inst) == 'string' and string.find(inst, "duplicate key") then
        inst = {
          errors = {
            "User " .. tostring(unique) .. " already exists!"
          }
        }
      end
      return {
        json = inst
      }
    end))
  })
end
local update_profile
update_profile = function(user_id, params)
  local profile = ProfileJson:find(user_id)
  if profile then
    profile.json = to_json(params.profile)
    return profile:update("json")
  else
    return ProfileJson:create({
      user_id = user_id,
      json = to_json(params.profile)
    })
  end
end
local update_groups
update_groups = function(user_id, groups)
  db.query("DELETE FROM user_group_index WHERE user_id = ?", user_id)
  for _index_0 = 1, #groups do
    local group_name = groups[_index_0]
    local slug = slugify(group_name)
    local group = Group:find({
      slug = slug
    })
    if not (group) then
      group = Group:create({
        name = group_name,
        slug = slug
      })
    end
    UserGroupIndex:create({
      user_id = user_id,
      group_id = group.id
    })
  end
end
local assert_base
assert_base = function(id, field)
  return function(params)
    return assert_valid(params, {
      {
        id,
        exists = true
      },
      {
        field,
        exists = true
      }
    })
  end
end
local assert_profile_json = assert_base("user_id", "profile_json")
local assert_content
assert_content = function(params)
  return assert_valid(params, {
    {
      "title",
      exists = true
    },
    {
      "content",
      exists = true
    },
    {
      "groups",
      exists = true
    },
    {
      "parent",
      exists = true
    },
    {
      "position",
      exists = true
    },
    {
      "site",
      exists = true
    }
  })
end
local delete_profile
delete_profile = function(user_id)
  local profile = Profile:find(user_id)
  local result = success()
  if profile then
    profile:delete()
  end
  if not (profile) then
    result = not_found("Profile")
  end
  return result
end
local get_or_set
get_or_set = function(Mod)
  return function(name)
    local slug = slugify(name)
    local mod = Mod:find({
      slug = slug
    })
    if not (mod) then
      mod = Mod:create({
        name = name,
        slug = slug
      })
    end
    return mod
  end
end
local get_or_set_site = get_or_set(Site)
local get_or_set_parent = get_or_set(Parent)
local get_or_set_position = get_or_set(Position)
local get_or_set_group = get_or_set(Group)
local create_content_json
create_content_json = function(params, content)
  return function()
    return ContentJson:create({
      content_id = content.id,
      json = to_json(params.content)
    })
  end
end
local create_group_content
create_group_content = function(group_id, parent_id, content_id, position_id, site_id, order)
  return pcall(GroupContentIndex:create({
    group_id = group_id,
    parent_id = parent_id,
    content_id = content_id,
    position_id = position_id,
    site_id = site_id,
    order = order
  }))
end
local update_additional_content
update_additional_content = function(content, params)
  local order = params.order or 0
  local site = get_or_set_site(params.site)
  local parent = get_or_set_parent(params.parent)
  local position = get_or_set_position(params.position)
  db.query('DELETE FROM "group_content_index" WHERE content_id = ? AND site_id = ? AND parent_id = ? AND position_id = ?;', content.id, site.id, parent.id, position.id)
  local _list_0 = params.groups
  for _index_0 = 1, #_list_0 do
    local group_name = _list_0[_index_0]
    local group = get_or_set_group(group_name)
    local ok, group_content = create_group_content(group.id, parent.id, content.id, position.id, site.id, order)
  end
end
local update_model
update_model = function(Mod, mod)
  return respond_to({
    POST = capture_errors_json(json_params(function(self)
      assert_valid(self.params, {
        {
          "name",
          exists = true
        }
      })
      local create_mod
      create_mod = function()
        return Mod:create({
          name = self.params.name,
          slug = slugify(self.params.name)
        })
      end
      local ok, nmod = pcall(create_mod)
      if type(nmod) == 'string' and string.find(nmod, "duplicate key") then
        nmod = {
          errors = {
            tostring(mod) .. " '" .. tostring(self.params.name) .. "' already exists!"
          }
        }
      end
      return {
        json = nmod
      }
    end)),
    PUT = capture_errors_json(json_params(function(self)
      assert_valid(self.params, {
        {
          "id",
          exists = true
        },
        {
          "name",
          exists = true
        }
      })
      local nmod = Mod:find(self.params.id)
      if nmod then
        nmod.name = self.params.name
        nmod.slug = self.params.slug or slugify(self.params.name)
        nmod:update("name", "slug")
      else
        nmod = {
          errors = {
            "No " .. tostring(mod) .. " found with id " .. tostring(self.params.id)
          }
        }
      end
      return {
        json = nmod
      }
    end))
  })
end
local search_model
search_model = function(Mod, mod)
  return respond_to({
    POST = capture_errors_json(json_params(function(self)
      local query
      if self.params.name then
        query = {
          name = self.params.name
        }
      else
        if self.params.slug then
          query = {
            slug = self.params.slug
          }
        end
      end
      local nmod = Mod:find(query)
      if not (nmod) then
        nmod = not_found(mod)
      end
      return {
        json = nmod
      }
    end))
  })
end
local delete_model
delete_model = function(Mod, mod)
  return respond_to({
    DELETE = capture_errors_json(json_params(function(self)
      local nmod = Mod:find(self.params.id)
      local result = success()
      if nmod then
        nmod:delete()
      end
      if not (nmod) then
        result = not_found(mod)
      end
      return {
        json = result
      }
    end))
  })
end
do
  local _parent_0 = lapis.Application
  local _base_0 = {
    ["/"] = function(self)
      return "Welcome to Lapis " .. tostring(require("lapis.version")) .. "!"
    end,
    ["/user"] = respond_to({
      POST = capture_errors_json(json_params(function(self)
        assert_valid(self.params, {
          {
            "username",
            exists = true,
            min_length = 8
          }
        })
        local create_user
        create_user = function()
          return User:create({
            username = self.params.username
          })
        end
        local ok, user = pcall(create_user)
        if type(user) == 'string' and string.find(user, "duplicate key") then
          user = {
            errors = {
              "User " .. tostring(self.params.username) .. " already exists!"
            }
          }
        else
          if self.params.profile then
            update_profile(user, self.params)
          end
          if self.params.groups then
            update_groups(user.id, self.params.groups)
          end
        end
        return {
          json = user
        }
      end)),
      PUT = capture_errors_json(json_params(function(self)
        assert_valid(self.params, {
          {
            "id",
            exists = true
          },
          {
            "username",
            exists = true,
            min_length = 8
          }
        })
        local user = User:find(self.params.id)
        if user then
          user.username = self.params.username
          user:update("username")
          if self.params.profile then
            update_profile(user, self.params)
          end
          if self.params.groups then
            update_groups(user.id, self.params.groups)
          end
        else
          user = {
            errors = {
              "No user found with id " .. tostring(self.params.id)
            }
          }
        end
        return {
          json = user
        }
      end))
    }),
    ["/user/search"] = respond_to({
      POST = capture_errors_json(json_params(function(self)
        local user = User:find({
          username = self.params.username
        })
        if user then
          local profile = ProfileJson:find(user.id)
          if profile then
            user.profile = from_json(profile.json)
          end
          local groups = db.query('\n            SELECT g.*\n            FROM "user_group_index" ugi\n            JOIN "group" g\n            ON ugi.group_id = g.id\n            WHERE\n            ugi.user_id = ?\n          ', user.id)
          if groups then
            user.groups = groups
          end
        else
          user = not_found("User")
        end
        return {
          json = user
        }
      end))
    }),
    ["/user/:id"] = respond_to({
      DELETE = capture_errors_json(json_params(function(self)
        local user = User:find(self.params.id)
        local result = success()
        if user then
          delete_profile(self.params.id)
          user:delete()
        end
        if not (user) then
          result = not_found("User")
        end
        return {
          json = result
        }
      end))
    }),
    ["/profile"] = respond_to({
      POST = capture_errors_json(json_params(function(self)
        assert_profile_json(self.params)
        local create_profile
        create_profile = function()
          return Profile:create({
            user_id = self.params.user_id,
            json = to_json(self.params.profile)
          })
        end
        local ok, profile = pcall(create_profile)
        if type(profile) == 'string' and string.find(profile, "duplicate key") then
          profile = {
            errors = {
              "Profile " .. tostring(self.params.profilename) .. " already exists!"
            }
          }
        end
        return {
          json = profile
        }
      end)),
      PUT = capture_errors_json(json_params(function(self)
        assert_profile_json(self.params)
        local profile = Profile:find(self.params.user_id)
        if profile then
          profile.json = to_json(self.params.profile)
          profile:update("json")
        else
          profile = {
            errors = {
              "No profile found with id " .. tostring(self.params.id)
            }
          }
        end
        return {
          json = profile
        }
      end))
    }),
    ["/profile/search"] = respond_to({
      POST = capture_errors_json(json_params(function(self)
        local profile = Profile:find({
          user_id = self.params.user_id
        })
        if not (profile) then
          profile = not_found("Profile")
        end
        return {
          json = profile
        }
      end))
    }),
    ["/profile/:id"] = respond_to({
      DELETE = capture_errors_json(json_params(function(self)
        delete_profile(self.params.id)
        return {
          json = result
        }
      end))
    }),
    ["/group"] = update_model(Group, "Group"),
    ["/group/search"] = search_model(Group, "Group"),
    ["/group/:id"] = delete_model(Group, "Group"),
    ["/site"] = update_model(Site, "Site"),
    ["/site/search"] = search_model(Site, "Site"),
    ["/site/:id"] = delete_model(Site, "Site"),
    ["/parent"] = update_model(Parent, "Parent"),
    ["/parent/search"] = search_model(Parent, "Parent"),
    ["/parent/:id"] = delete_model(Parent, "Parent"),
    ["/position"] = update_model(Position, "Position"),
    ["/position/search"] = search_model(Position, "Position"),
    ["/position/:id"] = delete_model(Position, "Position"),
    ["/content"] = respond_to({
      POST = capture_errors_json(json_params(function(self)
        assert_content(self.params)
        local create_content
        create_content = function()
          return Content:create({
            title = self.params.title
          })
        end
        local ok, content = pcall(create_content)
        if type(content) == 'string' and string.find(content, "duplicate key") then
          content = {
            errors = {
              "Content " .. tostring(self.params.title) .. " already exists!"
            }
          }
        else
          local create_content_json_inst = create_content_json(self.params, content)
          local content_json
          ok, content_json = pcall(create_content_json_inst)
          update_additional_content(content, self.params)
        end
        return {
          json = content
        }
      end)),
      PUT = capture_errors_json(json_params(function(self)
        assert_content(self.params)
        assert_valid(self.params, {
          {
            "id",
            exists = true
          }
        })
        local content = Content:find(self.params.id)
        if content then
          content.title = self.params.title
          content.updated_at = db.raw("(now() at time zone 'utc')")
          local update_content
          update_content = function()
            return content:update("title", "updated_at")
          end
          local ok, content_result = pcall(update_content)
          if type(content_result) == 'string' and string.find(content_result, "duplicate key") then
            content = {
              errors = {
                "Content " .. tostring(self.params.title) .. " already exists!"
              }
            }
          else
            local content_json = ContentJson:find(self.params.id)
            if content_json then
              content_json.json = to_json(self.params.content)
              content_json:update("json")
            end
            update_additional_content(content, self.params)
            content = {
              status = "success",
              errors = { }
            }
          end
        else
          content = {
            errors = {
              "No content found with id " .. tostring(self.params.id)
            }
          }
        end
        return {
          json = content
        }
      end))
    }),
    ["/content/search"] = respond_to({
      POST = capture_errors_json(json_params(function(self)
        assert_valid(self.params, {
          {
            "group",
            exists = true
          }
        })
        local qparts = { }
        local params = { }
        local add_filter
        add_filter = function(rparams, name, abbr)
          if rparams[name] then
            table.insert(params, rparams[name])
            return table.insert(qparts, "AND " .. tostring(abbr) .. " = ?")
          end
        end
        table.insert(params, self.params.group)
        table.insert(qparts, "WHERE g.name = ?")
        add_filter(self.params, 'parent', 'p.name')
        add_filter(self.params, 'position', 'po.name')
        add_filter(self.params, 'site', 's.name')
        local base_sql = '\n          SELECT g.name, p.name, po.name, s.name, cj.json\n            FROM group_content_index gci\n            JOIN "group" g\n              ON gci.group_id = g.id\n            JOIN parent p\n              ON gci.parent_id = p.id\n            JOIN content c\n              ON gci.content_id = c.id\n            JOIN position po\n              ON gci.position_id = po.id\n            JOIN site s\n              ON gci.site_id = s.id\n            JOIN content_json cj\n              ON gci.content_id = cj.content_id'
        for _index_0 = 1, #qparts do
          local qpart = qparts[_index_0]
          base_sql = base_sql .. "\n" .. qpart
        end
        local sql = base_sql .. "\n" .. 'ORDER BY gci.order ASC'
        local convert_json
        convert_json = function(result)
          result.json = from_json(result.json)
          return result
        end
        local content = db.query(sql, unpack(params))
        do
          local _accum_0 = { }
          local _len_0 = 1
          for _index_0 = 1, #content do
            local result = content[_index_0]
            _accum_0[_len_0] = convert_json(result)
            _len_0 = _len_0 + 1
          end
          content = _accum_0
        end
        return {
          json = content
        }
      end))
    }),
    ["/content/:id"] = respond_to({
      DELETE = capture_errors_json(json_params(function(self)
        local content = Content:find(self.params.id)
        local result = success()
        if content then
          delete_profile(self.params.id)
          content:delete()
        end
        if not (content) then
          result = not_found("Content")
        end
        return {
          json = result
        }
      end))
    })
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  local _class_0 = setmetatable({
    __init = function(self, ...)
      return _parent_0.__init(self, ...)
    end,
    __base = _base_0,
    __name = nil,
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        return _parent_0[name]
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  self:before_filter(function(self)
    if self.cookie[config.session_cookie] then
      self.current_user = config.load_user(self.cookie[config.session_cookie])
    else
      return self:write({
        redirect_to = config.login_url
      })
    end
  end)
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  return _class_0
end
