#
# Cookbook Name:: timezone
# Recipe:: default
#

execute "Set server timezone to Copenhagen" do
  command "ln -sf /usr/share/zoneinfo/Europe/Copenhagen /etc/localtime"
  command "sudo /etc/init.d/vixie-cron stop"
  command "sudo /etc/init.d/vixie-cron start"
end
