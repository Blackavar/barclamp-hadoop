#
# Cookbook Name: hadoop
# Recipe: hbase.rb
#
# Copyright (c) 2011 Dell Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#######################################################################
# Begin recipe transactions
#######################################################################
debug = node[:hadoop][:debug]
Chef::Log.info("BEGIN hadoop:hbase") if debug

# Create the logging directory with proper permissions. 
ldir = node[:hadoop][:hbase][:hbase_log_dir]
directory ldir do
  owner "root"
  group "hadoop"
  mode "0775"
  recursive true
  action :create
  not_if "test -d #{ldir}"
end

# Install the hbase package.
package "hadoop-hbase" do
  action :install
  # version node[:hadoop][:packages][:hbase][:version]
end

#######################################################################
# End of recipe transactions
#######################################################################
Chef::Log.info("END hadoop:hbase") if debug
