#
# Cookbook Name:: linux-user-management
# Recipe:: groups
#
# Copyright 2014, Vikram
#
# All rights reserved - Do Not Redistribute
#

include_recipe "users"

users_manage "support" do
  data_bag "support"
  group_id 2400
  action [ :remove, :create ]
end

users_manage "operations" do
  data_bag "operations"
  group_id 2401
  action [ :remove, :create ]
end

users_manage "tools" do
  data_bag "tools"
  group_id 2402
  action [ :remove, :create ]
end

users_manage "troubleshooters" do
  data_bag "troubleshooters"
  group_id 2403
  action [ :remove, :create ]
end