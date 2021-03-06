# cf) https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
case node[:platform]
when 'debian', 'ubuntu', 'mint'
  package 'autoconf'
  package 'bison'
  package 'build-essential'
  package 'libffi-dev'
  package 'libgdbm-dev'
  if node[:platform] == 'ubuntu' && node[:platform_version] >= '18.04'
    package 'libgdbm5'
    package 'libreadline-dev'
  else
    package 'libgdbm3'
    package 'libreadline6-dev'
  end
  package 'libncurses5-dev'
  package 'libssl-dev'
  package 'libyaml-dev'
  package 'zlib1g-dev'
when 'redhat', 'fedora', 'amazon'
  # redhat is including CentOS
  package 'bzip2'
  package 'gcc'
  package 'gdbm-devel'
  package 'libffi-devel'
  package 'libyaml-devel'
  package 'ncurses-devel'
  package 'openssl-devel'
  package 'readline-devel'
  package 'zlib-devel'
when 'osx', 'darwin'
  package 'libffi'
  package 'libyaml'
  package 'openssl'
when 'arch'
  package 'base-devel'
  package 'libffi'
  package 'libyaml'
  package 'openssl'
  package 'zlib'
when 'opensuse'
  package 'automake'
  package 'gcc'
  package 'gdbm-devel'
  package 'libffi-devel'
  package 'libyaml-devel'
  package 'ncurses-devel'
  package 'openssl-devel'
  package 'readline-devel'
  package 'zlib-devel'
when 'openbsd'
  package 'autoconf'
  package 'bison'
  package 'gdbm'
  package 'libffi'
  package 'libyaml'
  package 'openssl'
  package 'readline'
else
  raise NotImplementedError, "Platform '#{node[:platform]}' is not supported by rbenv::dependency yet"
end

package 'git'
