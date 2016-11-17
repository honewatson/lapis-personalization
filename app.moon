lapis = require "lapis"
import json_params, capture_errors_json, respond_to from require "lapis.application"
import Model from require "lapis.db.model"
--import capture_errors_json from require "lapis.util"
import assert_valid from require "lapis.validate"
import slugify, to_json, from_json from require "lapis.util"

config = require("lapis.config").get!



db = require "lapis.db"

class User extends Model
class ProfileJson extends Model
  @primary_key: 'user_id'

class Parent extends Model
class Site extends Model
class Group extends Model
class Position extends Model
class Content extends Model
class ContentJson extends Model
  @primary_key: 'content_id'

class UserGroupIndex extends Model
  @primary_key: {'user_id', 'group_id'}

class GroupContentIndex extends Model
  @primary_key: {'group_id', 'content_id'}

success = () ->
  { message: "Success!" }

not_found = (name) ->
  { message: "#{name} not found!" }

create = (create_inst, params, unique, asserts) ->
  respond_to {
      POST: capture_errors_json json_params =>
        assert_valid params, asserts
        ok, inst = pcall create
        if type(inst) == 'string' and string.find(inst, "duplicate key")
          inst = {errors: {"User #{unique} already exists!"}}
        json: inst
  }

update_profile = (user_id, params) ->
  profile = ProfileJson\find user_id
  if profile
    profile.json = to_json params.profile
    profile\update "json"
  else
    ProfileJson\create {
      user_id: user_id,
      json: to_json params.profile
    }

update_groups = (user_id, groups) ->
  db.query "DELETE FROM user_group_index WHERE user_id = ?", user_id
  for group_name in *groups
    slug = slugify group_name
    group = Group\find slug: slug
    unless group
      group = Group\create {
        name: group_name,
        slug: slug
      }
    UserGroupIndex\create {
      user_id: user_id,
      group_id: group.id
    }

assert_base = (id, field) -> (params) ->
    assert_valid params, {
      { id, exists: true }
      { field, exists: true }
    }

assert_profile_json = assert_base "user_id", "profile_json"

assert_content = (params) ->
  assert_valid  params, {
    { "title", exists: true }
    { "content", exists: true }
    { "groups", exists: true }
    { "parent", exists: true }
    { "position", exists: true }
    { "site", exists: true }
  }

delete_profile = (user_id) ->
    profile = Profile\find user_id
    result = success!
    if profile
      profile\delete!
    unless profile
      result =  not_found "Profile"
    return result

-- get_or_create_parent
-- get_or_create_position
-- get_or_create_site
get_or_set = (Mod) -> (name) ->
    slug = slugify name
    mod = Mod\find slug: slug
    unless mod
      mod = Mod\create {
        name: name
        slug: slug
      }
    return mod

get_or_set_site = get_or_set Site
get_or_set_parent = get_or_set Parent
get_or_set_position = get_or_set Position
get_or_set_group = get_or_set Group


create_content_json = (params, content) -> ->
  ContentJson\create {
    content_id: content.id,
    json: to_json params.content
  }

create_group_content = (group_id, parent_id, content_id, position_id, site_id, order) ->
  pcall GroupContentIndex\create {
    group_id: group_id,
    parent_id: parent_id,
    content_id: content_id,
    position_id: position_id,
    site_id: site_id,
    order: order
  }

update_additional_content = (content, params) ->
  order = params.order or 0
  site = get_or_set_site params.site
  parent = get_or_set_parent params.parent
  position = get_or_set_position params.position
  db.query 'DELETE FROM "group_content_index" WHERE content_id = ? AND site_id = ? AND parent_id = ? AND position_id = ?;', content.id, site.id, parent.id, position.id
  for group_name in *params.groups
    group = get_or_set_group group_name
    ok, group_content = create_group_content group.id, parent.id, content.id, position.id, site.id, order

assert_admin = (user) ->
  assert_valid user, {
    { "group", equals: "admin" }
  }

update_model = (Mod, mod) -> respond_to {
      POST: capture_errors_json json_params =>
        assert_admin @current_user
        assert_valid  @params, {
          { "name", exists: true }
        }
        create_mod = ->
          Mod\create {
            name: @params.name,
            slug: slugify @params.name
          }
        ok, nmod = pcall create_mod
        --json: @params
        if type(nmod) == 'string' and string.find(nmod, "duplicate key")
          nmod = {errors: {"#{mod} '#{@params.name}' already exists!"}}
        json: nmod

      PUT: capture_errors_json json_params =>
        assert_admin @current_user
        assert_valid  @params, {
          { "id", exists: true }
          { "name", exists: true }
        }
        nmod = Mod\find @params.id
        if nmod
          nmod.name = @params.name
          nmod.slug = @params.slug or slugify @params.name
          nmod\update "name", "slug"
        --json: @params
        else
          nmod = {errors: {"No #{mod} found with id #{@params.id}"}}
        json: nmod
  }

search_model = (Mod, mod) -> respond_to {
      POST: capture_errors_json json_params =>
        assert_admin @current_user
        local query
        if @params.name
          query = name: @params.name
        else if @params.slug
          query = slug: @params.slug
        nmod = Mod\find query
        unless nmod
          nmod = not_found mod
        json: nmod
  }

delete_model = (Mod, mod) -> respond_to {
      DELETE: capture_errors_json json_params =>
        assert_admin @current_user
        nmod = Mod\find @params.id
        result = success!
        if nmod
          nmod\delete!
        unless nmod
          result =  not_found mod
        json: result
  }


class extends lapis.Application
  @before_filter =>
    if @cookie[config.session_cookie]
      @current_user = config.load_user @cookie[config.session_cookie]
    else
      @write redirect_to: config.login_url

  "/": =>
    "Welcome to Lapis #{require "lapis.version"}!"
  "/user": respond_to {
      POST: capture_errors_json json_params =>
        assert_admin @current_user
        assert_valid  @params, {
          { "username", exists: true, min_length: 8 }
        }
        create_user = ->
          User\create {
            username: @params.username
          }
        ok, user = pcall create_user
        --json: @params
        if type(user) == 'string' and string.find(user, "duplicate key")
          user = {errors: {"User #{@params.username} already exists!"}}
        else
          if @params.profile
            update_profile user, @params
          if @params.groups
            update_groups user.id, @params.groups
        json: user

      PUT: capture_errors_json json_params =>
        assert_admin @current_user
        assert_valid  @params, {
          { "id", exists: true }
          { "username", exists: true, min_length: 8 }
        }
        user = User\find @params.id
        if user
          user.username = @params.username
          user\update "username"
          if @params.profile
            update_profile user, @params
          if @params.groups
            update_groups user.id, @params.groups
        --json: @params
        else
          user = {errors: {"No user found with id #{@params.id}"}}
        json: user
  }
  "/user/search": respond_to {
      POST: capture_errors_json json_params =>
        assert_admin @current_user
        user = User\find username: @params.username
        if user
          profile = ProfileJson\find user.id
          if profile
            user.profile = from_json profile.json
          groups = db.query '
            SELECT g.*
            FROM "user_group_index" ugi
            JOIN "group" g
            ON ugi.group_id = g.id
            WHERE
            ugi.user_id = ?
          ', user.id
          if groups
            user.groups = groups
        else
          user = not_found "User"
        json: user
  }
  "/user/:id": respond_to {
      DELETE: capture_errors_json json_params =>
        assert_admin @current_user
        user = User\find @params.id
        result = success!
        if user
          delete_profile @params.id
          --TODO: Remove groups and profile
          user\delete!
        unless user
          result =  not_found "User"
        json: result
  }

  "/profile": respond_to {
      POST: capture_errors_json json_params =>
        assert_admin @current_user
        assert_profile_json @params
        create_profile = ->
          Profile\create {
            user_id: @params.user_id,
            json: to_json @params.profile
          }
        ok, profile = pcall create_profile
        --json: @params
        if type(profile) == 'string' and string.find(profile, "duplicate key")
          profile = {errors: {"Profile #{@params.profilename} already exists!"}}
        json: profile

      PUT: capture_errors_json json_params =>
        assert_admin @current_user
        assert_profile_json @params
        profile = Profile\find @params.user_id
        if profile
          profile.json = to_json @params.profile
          profile\update "json"
        --json: @params
        else
          profile = {errors: {"No profile found with id #{@params.id}"}}
        json: profile
      
      GET: capture_errors_json json_params =>
        profile = Profile\find user_id: @current_user.user_id
        unless profile
          profile = not_found "Profile"
        json: profile
  }
  "/profile/search": respond_to {
      POST: capture_errors_json json_params =>
        assert_admin @current_user
        profile = Profile\find user_id: @params.user_id
        unless profile
          profile = not_found "Profile"
        json: profile
  }
  "/profile/:id": respond_to {
      DELETE: capture_errors_json json_params =>
        assert_admin @current_user
        delete_profile @params.id
        json: result
  }
  
  "/group": update_model Group, "Group"

  "/group/search": search_model Group, "Group"

  "/group/:id": delete_model Group, "Group"

  "/site": update_model Site, "Site"

  "/site/search": search_model Site, "Site"
  
  "/site/:id": delete_model Site, "Site"

  "/parent": update_model Parent, "Parent"

  "/parent/search": search_model Parent, "Parent"

  "/parent/:id": delete_model Parent, "Parent"

  "/position": update_model Position, "Position"

  "/position/search": search_model Position, "Position"

  "/position/:id": delete_model Position, "Position"

  "/content": respond_to {
      POST: capture_errors_json json_params =>
        -- groups,parent,content,content_json,site,order
        assert_admin @current_user
        assert_content @params
        create_content = ->
          Content\create {
            title: @params.title
          }
        ok, content = pcall create_content
        --json: @params
        if type(content) == 'string' and string.find(content, "duplicate key")
          content = {errors: {"Content #{@params.title} already exists!"}}
        else
          create_content_json_inst = create_content_json @params, content
          ok, content_json = pcall create_content_json_inst
          update_additional_content content, @params
        json: content

      PUT: capture_errors_json json_params =>
        assert_admin @current_user
        assert_content @params
        assert_valid  @params, {
          { "id", exists: true }
        }
        content = Content\find @params.id
        if content
          content.title = @params.title
          content.updated_at = db.raw "(now() at time zone 'utc')"
          update_content = ->
            content\update "title", "updated_at"
          ok, content_result = pcall update_content
          if type(content_result) == 'string' and string.find(content_result, "duplicate key")
            content = {errors: {"Content #{@params.title} already exists!"}}
          else
            content_json = ContentJson\find @params.id
            if content_json
              content_json.json = to_json @params.content
              content_json\update "json"
            update_additional_content content, @params
            content = {status: "success", errors: {}}
        --json: @params
        else
          content = {errors: {"No content found with id #{@params.id}"}}
        json: content
  }
  "/content/search": respond_to {
      POST: capture_errors_json json_params =>
        -- group, parent, position, site
        group
        if @params.group
          assert_admin @current_user
          group = @params.group
        else
          assert_valid @current_user, {
            { "group", exists: true }
          }
          group = @current_user.group
          @params.site = @current_user.site

        qparts = {}
        params = {}
        add_filter = (rparams, name, abbr) ->
          if rparams[name]
            table.insert params, rparams[name]
            table.insert qparts, "AND #{abbr} = ?"
        table.insert params, group
        table.insert qparts, "WHERE g.name = ?"
        add_filter @params, 'site', 's.name'
        add_filter @params, 'parent', 'p.name'
        add_filter @params, 'position', 'po.name'
        base_sql = '
          SELECT g.name, p.name, po.name, s.name, cj.json
            FROM group_content_index gci
            JOIN "group" g
              ON gci.group_id = g.id
            JOIN parent p
              ON gci.parent_id = p.id
            JOIN content c
              ON gci.content_id = c.id
            JOIN position po
              ON gci.position_id = po.id
            JOIN site s
              ON gci.site_id = s.id
            JOIN content_json cj
              ON gci.content_id = cj.content_id'
        for qpart in *qparts
          base_sql = base_sql .. "\n" .. qpart
        sql = base_sql .. "\n" .. 'ORDER BY gci.order ASC'
        
        convert_json = (result) ->
          result.json = from_json result.json
          return result
        content = db.query sql, unpack params
        content = [ convert_json result for result in *content ]
        json: content
  }
  "/content/:id": respond_to {
      DELETE: capture_errors_json json_params =>
        assert_admin @current_user
        content = Content\find @params.id
        result = success!
        if content
          delete_profile @params.id
          --TODO: Remove groups and profile
          content\delete!
        unless content
          result =  not_found "Content"
        json: result
  }

