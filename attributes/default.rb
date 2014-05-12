default['ocentric'][:server_name] = "localhost"
default['ocentric'][:server_aliases] = [ ]
default['ocentric'][:allowedIps] = [ '127.0.0.1' ]
default['ocentric'][:server_canonical_rewrite] = false
default['ocentric'][:apc][:shm_size] = '512M'
default['ocentric'][:apc][:stat] = 1
default['ocentric'][:apc][:enable_cli] = 0


default['ocentric']['artifact_path'] = '/srv/nfs/packages'
default['ocentric']['version_databag'] = 'nestle-dolcegusto-version'

default['ocentric']['owner'] = 'apache'
default['ocentric']['group'] = 'apache'

default['magento'] = {

  "global" => {
    "version" => "VERSION",
    "session_save" => "memcache",
    "session_save_path" => "<![CDATA[tcp://{{ocentric_backend_dns}}:11211/?persistent=0&timeout=40&retry_interval=1]]>",

    "itemreservation_redis_options" => {
      "host" => "{{ocentric_backend_dns}}",
      "port" => "6379",
      "database" => 4,
      "retry" => 3
    },

    "cache" => {
      "backend" => "Optaros_Cache_Backend_TwoLevels_Fast",
      "backend_options" => {
        "local_backend" => "Zend_Cache_Backend_Apc",
        "distributed_backend" => "Zend_Cache_Backend_Memcached",
      },
      "slow_backend" => "Optaros_Cache_Backend_Redis",
      "slow_backend_store_data" => "0",
      "slow_backend_options" => {
        "host" => "{{ocentric_backend_dns}}",
        "port" => "6379",
        "database" => 1,
        "clean_tags_chance" => 1000
      }
    },

    "full_page_cache" => {
      "backend" => "Optaros_Cache_Backend_TwoLevels_Fast",
      "backend_options" => {
        "local_backend" => "Zend_Cache_Backend_Apc",
        "distributed_backend" => "Zend_Cache_Backend_Memcached",
      },
      "slow_backend" => "Optaros_Cache_Backend_Redis",
      "slow_backend_store_data" => "0",
      "slow_backend_options" => {
        "host" => "{{ocentric_backend_dns}}",
        "port" => "6379",
        "database" => 1,
        "clean_tags_chance" => 1000
      }
    },

    "locking" => {
      "backends" => {
        "redis" => {
          "class" => "Optaros_Lock_Backend_Redis",
          "options" => {
            "host" => "{{ocentric_backend_dns}}",
            "port" => "6379",
            "database" => 1,
            "lock_timeout" => 1800,
            "lock_sleep" => 0
          }
        }
      }
    },

    "install" => {
      "date" => "Thu, 12 Nov 2009 15:08:59 +0000"
    },

    "resources" => {
      "db" => {
        "table_prefix" => ""
      },

      "default_setup" => {
        "connection" => {
          "host" => "{{ocentric_db_host}}",
          "username" => "{{ocentric_db_username}}",
          "password" => "{{ocentric_db_password}}",
          "dbname" => "{{ocentric_magento_db_name}}",
          "active" => "1"
        }
      }
    }
  }

}
