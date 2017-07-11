
docker_compose_version = "1.14.0"
docker_compose_path = "/usr/local/bin/docker-compose"

packages = %w(
  yum-utils
  device-mapper-persistent-data
  lvm2
)

packages.each do |p|
  package p
end


execute "Setup Docker repo" do
  command "yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo"
end

package "docker-ce"

group "docker" do
  action :modify
  members "vagrant"
  append true
end

execute "Start Docker" do
  command "service docker start"
  not_if "service docker status"
end

execute "Install Docker Compose" do
  command "curl -Lo #{docker_compose_path} https://github.com/docker/compose/releases/download/#{docker_compose_version}/docker-compose-Linux-x86_64 && chmod +x #{docker_compose_path}"
  not_if "test -f #{docker_compose_path}"
end

