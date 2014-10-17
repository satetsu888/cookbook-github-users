#
# Cookbook Name:: github-users
# Recipe:: default
#
# Copyright 2014, satetsu888
#
# All rights reserved - satetsu888
#

accounts = node['github-users']['accounts']
dotfiles_repository = node['github-users']['dotfiles_repository']
tmp_dir = node['github-users']['dotfiles_temporary_dir']

accounts.each do |account|
    user account do
        supports :manage_home => true
        home     "/home/#{account}"
    end

    directory "/home/#{account}/.ssh" do
        owner account
        group account
        mode '0700'
        action :create
    end

    remote_file "/home/#{account}/.ssh/authorized_keys" do
        source "https://github.com/#{account}.keys"
    end

    include_recipe 'openssl::upgrade'

    execute 'clean tmp_dir' do
        command 'rm -rf ./' + tmp_dir
        only_if do File.exist?(tmp_dir) end
    end

    execute 'clone and copy dotfiles repo' do
        command <<-EOC
            git clone https://github.com/#{account}/#{dotfiles_repository}.git #{tmp_dir}
            cd #{tmp_dir}
            ls -A | xargs -IFILE mv ./FILE /home/#{account}/
            cd
        EOC
    end

    user account do
        shell  "/bin/zsh"
        only_if do File.exist?("#{tmp_dir}/.zshrc") end
    end

    execute 'clean tmp_dir' do
        command 'rm -rf ./' + tmp_dir
        only_if do File.exist?(tmp_dir) end
    end

end
