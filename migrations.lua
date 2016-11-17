local create_index, create_table, types
do
  local _obj_0 = require("lapis.db.schema")
  create_index, create_table, types = _obj_0.create_index, _obj_0.create_table, _obj_0.types
end
return {
  [1] = function(self)
    create_table("user", {
      {
        "id",
        types.serial
      },
      {
        "username",
        types.varchar
      },
      "PRIMARY KEY (id)"
    })
    create_index("user", "username", {
      unique = true
    })
    create_table("site", {
      {
        "id",
        "smallserial"
      },
      {
        "name",
        types.varchar
      },
      {
        "slug",
        types.varchar
      },
      "PRIMARY KEY (id)"
    })
    create_index("site", "name")
    create_index("site", "slug", {
      unique = true
    })
    create_table("group", {
      {
        "id",
        "smallserial"
      },
      {
        "name",
        types.varchar
      },
      {
        "slug",
        types.varchar
      },
      "PRIMARY KEY (id)"
    })
    create_index("group", "name")
    create_index("group", "slug", {
      unique = true
    })
    create_table("parent", {
      {
        "id",
        "smallserial"
      },
      {
        "name",
        types.varchar
      },
      {
        "slug",
        types.varchar
      },
      "PRIMARY KEY (id)"
    })
    create_index("parent", "name")
    create_index("parent", "slug", {
      unique = true
    })
    create_table("position", {
      {
        "id",
        "smallserial"
      },
      {
        "name",
        types.varchar
      },
      {
        "slug",
        types.varchar
      },
      "PRIMARY KEY (id)"
    })
    create_index("position", "name")
    create_index("position", "slug", {
      unique = true
    })
    create_table("content", {
      {
        "id",
        types.serial
      },
      {
        "title",
        types.varchar
      },
      {
        "created_at",
        "timestamp without time zone default (now() at time zone 'utc')"
      },
      {
        "updated_at",
        "timestamp without time zone default (now() at time zone 'utc')"
      },
      {
        "published_at",
        "timestamp without time zone default (now() at time zone 'utc')"
      },
      "PRIMARY KEY (id)"
    })
    create_index("content", "title", {
      unique = true
    })
    create_index("content", "published_at")
    create_table("content_small_links", {
      {
        "content_id",
        types.integer
      },
      {
        "url",
        types.varchar
      },
      {
        "image_url",
        types.varchar
      },
      {
        "summary",
        types.varchar
      },
      "PRIMARY KEY (content_id)"
    })
    create_table("content_html", {
      {
        "content_id",
        types.integer
      },
      {
        "html",
        types.text
      },
      "PRIMARY KEY (content_id)"
    })
    create_table("content_json", {
      {
        "content_id",
        types.integer
      },
      {
        "json",
        types.text
      },
      "PRIMARY KEY (content_id)"
    })
    create_table("profile_html", {
      {
        "user_id",
        types.integer
      },
      {
        "html",
        types.text
      },
      "PRIMARY KEY (user_id)"
    })
    create_table("profile_json", {
      {
        "user_id",
        types.integer
      },
      {
        "json",
        types.text
      },
      "PRIMARY KEY (user_id)"
    })
    create_table("user_group_index", {
      {
        "user_id",
        types.integer
      },
      {
        "group_id",
        "smallint"
      },
      "PRIMARY KEY (user_id, group_id)"
    })
    create_index("user_group_index", "user_id")
    create_table("group_content_index", {
      {
        "group_id",
        "smallint"
      },
      {
        "parent_id",
        types.integer
      },
      {
        "content_id",
        types.integer
      },
      {
        "position_id",
        "smallint"
      },
      {
        "site_id",
        "smallint"
      },
      {
        "order",
        "smallint"
      },
      "PRIMARY KEY (group_id, parent_id, content_id, position_id, site_id)"
    })
    return create_index("group_content_index", "order")
  end
}
