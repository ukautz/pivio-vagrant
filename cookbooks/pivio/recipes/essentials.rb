
packages = %w(
  java-1.8.0-openjdk-headless.x86_64
  java-1.8.0-openjdk-devel
  git
)

packages.each do |p|
  package p
end
