name             'github-users'
maintainer       'satetsu888'
maintainer_email 'satetsu888@gmail.com'
license          'Apache v2.0'
description      'Create users who has ssh-key on github and has dotfiles repo at his home dir'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
provides         'github-users:default'
supports         'centos'
version          '0.1.6'

depends 'git'
depends 'openssl'
