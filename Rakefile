#!/usr/bin/env rake

desc 'chefspec'
task :rspec do |t|
    if Gem::Version.new( '1.9.2' ) <= Gem::Version.new( RUBY_VERSION.dup )
        require 'rspec/core/rake_task'
        RSpec::Core::RakeTask.new( :rspec ) do |t|
            spec_files_path = './test/integration/default/serverspec/localhost/*_spec.rb'
            t.pattern = spec_files_path
            t.rspec_opts = ['-c']
        end
    end
end

task :default => [ :rspec ]
