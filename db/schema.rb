# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150126132433) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.text     "domain_names"
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ruby_version",                            :default => "2.0.0-p195"
    t.string   "rails_environment",                       :default => "production"
    t.string   "database_host",                           :default => "localhost"
    t.string   "database_name"
    t.string   "deploy_user",                             :default => "deploy"
    t.binary   "database_user_encrypted"
    t.binary   "database_password_encrypted"
    t.boolean  "enable_ssl",                              :default => false
    t.integer  "connect_to_database_from_application_id"
    t.boolean  "use_database_from_other_application"
  end

  create_table "backups", :force => true do |t|
    t.boolean  "enabled",              :default => false
    t.integer  "application_id"
    t.integer  "storage_type",         :default => 0
    t.string   "dropbox_api_key"
    t.string   "dropbox_api_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "s3_access_key"
    t.string   "s3_secret_access_key"
    t.string   "s3_bucket"
    t.string   "s3_region",            :default => "eu-west-1"
  end

  add_index "backups", ["application_id"], :name => "index_backups_on_application_id"

  create_table "containers", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     :default => 0
  end

  add_index "containers", ["server_id"], :name => "index_containers_on_server_id"

  create_table "env_vars", :force => true do |t|
    t.integer  "application_id"
    t.string   "key"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", :force => true do |t|
    t.string   "stripe_id"
    t.string   "stripe_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stripe_amount"
    t.string   "stripe_currency"
    t.datetime "deleted_at"
    t.boolean  "active"
    t.integer  "max_servers"
    t.boolean  "staff",           :default => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "servers", :force => true do |t|
    t.string   "name",                                                :null => false
    t.string   "address"
    t.boolean  "bootstrapped"
    t.string   "username"
    t.integer  "ssh_port",                     :default => 22
    t.integer  "owner_id",                                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "ssh_deploy_keys"
    t.boolean  "working",                      :default => false
    t.string   "last_error"
    t.binary   "rsa_key_encrypted"
    t.binary   "mysql_passwords_encrypted"
    t.boolean  "archived",                     :default => false
    t.datetime "applied_at"
    t.string   "stack",                        :default => "rails"
    t.string   "applications_root",            :default => "/u/apps"
    t.binary   "postgres_passwords_encrypted"
    t.string   "db_type",                      :default => "mysql"
    t.string   "server_version"
    t.integer  "provider",                     :default => 0
    t.integer  "digitalocean_region",          :default => 0
    t.integer  "digitalocean_id"
    t.integer  "stack_type",                   :default => 0
  end

  create_table "ssh_keys", :force => true do |t|
    t.string   "name"
    t.text     "key"
    t.integer  "server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.string   "stripe_customer_id"
    t.datetime "canceled_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "tin"
    t.integer  "vat"
    t.string   "stripe_subscription_id"
    t.datetime "stripe_current_period_start"
    t.datetime "stripe_current_period_end"
    t.string   "stripe_status"
  end

  add_index "subscriptions", ["plan_id"], :name => "index_subscriptions_on_plan_id"
  add_index "subscriptions", ["user_id"], :name => "index_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                     :default => "",    :null => false
    t.string   "encrypted_password",        :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "staff",                     :default => false
    t.string   "digitalocean_access_token"
    t.string   "stripe_customer_id"
    t.datetime "trial_started_at"
    t.string   "full_name"
    t.boolean  "trial_message_shown",       :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
