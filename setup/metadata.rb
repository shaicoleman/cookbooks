name             'setup'
maintainer       'Shai Coleman'
maintainer_email 'git@shaicoleman.com'
license          'Apache 2.0'
description      'Installs/Configures setup'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "setup::swap", "Sets up swap space"
