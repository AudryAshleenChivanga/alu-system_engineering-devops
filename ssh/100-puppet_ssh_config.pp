#!/usr/bin/env bash
#The following script will install and configure ssh on a remote server using puppet

class ssh_config {

  file { '/etc/ssh/ssh_config':
    ensure => file,
  }

  file_line { 'Declare identity file':
    path    => '/etc/ssh/ssh_config',
    line    => 'IdentityFile ~/.ssh/schooli',
    match   => '^IdentityFile',
    replace => true,
  }

  file_line { 'Turn off passwd auth':
    path    => '/etc/ssh/ssh_config',
    line    => 'PasswordAuthentication no',
    match   => '^PasswordAuthentication',
    replace => true,
  }
}

include ssh_config
