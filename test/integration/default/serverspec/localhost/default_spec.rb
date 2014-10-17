require 'serverspec'

# Required by serverspec
set :backend, :exec
     
describe package("git") do
    it { should be_installed }
end

describe package("openssl") do
    it { should be_installed }
end

describe user("satetsu888") do
    it { should exist }
    it { should have_home_directory '/home/satetsu888' }
    it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBaqk2wdvituCiZI0v9bfjUhtHoMzjduBJkNDHpY7w8/QBEE81K9YSQnPH6kLPrF7wDmEj+aBuCnQ/faFbF1XQLjpP6tQLEmZggtS1zsUsne8shHAQMCwTXVjTyQiui2au1aOqm1LXGdqJs3Jldt1VzeeyQfyruA2yTyH5B8ebAiw=='}
end
