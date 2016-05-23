require 'json'
require 'yaml'

VAGRANTFILE_API_VERSION = "2"

confDir = File.expand_path(File.dirname(__FILE__) + "/config");

ConfigFile = confDir + "/config.yaml"

require File.expand_path(File.dirname(__FILE__) + '/scripts/centstead.rb')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  Centstead.configure(config, YAML::load(File.read(ConfigFile)))

end