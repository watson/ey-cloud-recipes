#
# Cookbook Name:: timezone
# Recipe:: default
#

execute "Set server timezone to Copenhagen" do
  command "ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime"
end

execute "Stop crontab" do
  command "sudo /etc/init.d/vixie-cron stop"
end

execute "Start crontab" do
  command "sudo /etc/init.d/vixie-cron start"
end
