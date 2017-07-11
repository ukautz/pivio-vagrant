include_recipe "pivio::docker"
include_recipe "pivio::essentials"


directory '/opt/pivio' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


execute "Install Pivio" do
  command "curl https://raw.githubusercontent.com/pivio/pivio-boot/master/pivio.sh | /bin/sh"
  cwd "/opt/pivio"
  not_if "test -d /opt/pivio/pivio-server"
end

cookbook_file "/etc/systemd/system/pivio.service" do
  source 'pivio.systemd'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end