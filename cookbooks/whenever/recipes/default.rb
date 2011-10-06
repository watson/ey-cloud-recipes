#
# Cookbook Name:: whenever
# Recipe:: default
#

ey_cloud_report "whenever" do
  message "starting whenever recipe"
end

node[:applications].each do |app_name, data|
  if %w{solo util}.include? node[:instance_role]
    local_user = node[:users].first

    execute 'whenever' do
      cwd "/data/#{app_name}/current"
      user local_user[:username]
      command "bundle exec whenever --update-crontab '#{app_name}' --set environment=#{node[:environment][:framework_env]}"
      action :run
    end
  end
end

ey_cloud_report "whenever" do
  message "whenever recipe complete"
end
