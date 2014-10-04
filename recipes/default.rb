#
# Cookbook Name:: github-users
# Recipe:: default
#
# Copyright 2014, satetsu888
#
# All rights reserved - satetsu888
#
accounts = node['github-users']['accounts']

accounts.each do |account|
    user account do
        home     '/home/' + account
    end

    directory '/home/' + account + '/.ssh' do
        owner account
        group account
        mode '0700'
        action :create
    end

    remote_file '/home/' + account + '/.ssh/authorized_keys' do
        source 'https://github.com/' + account + '.keys'
    end

end
