# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.4"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.1"
github "git",         "2.7.92"
github "go",          "2.1.0"
github "homebrew",    "1.12.0"
github "hub",         "1.4.1"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.5"
github "nodejs",      "4.0.1"
github "openssl",     "1.0.0"
github "phantomjs",   "2.4.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.2"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "chrome",                "1.2.0"
github "dropbox",               "1.4.1"
github "evernote",              "2.0.7"
github "onepassword",           "1.1.5"
github "kaleidoscope",          "1.0.5", :repo => "ngs/puppet-kaleidoscope"
github "wget",                  "1.0.1"
github "alfred",                "1.5.0"
github "bartender",             "1.0.0", :repo => "erichkist/puppet-bartender"
github "clean_my_mac2",         "0.0.2", :repo => "steinim/puppet-clean_my_mac2"
github "divvy",                 "1.0.1"
github "firefox",               "1.2.3"
github "fantastical",           "0.0.3", :repo => "demonbane/puppet-fantastical"
github "hazel",                 "0.0.3", :repo => "fromonesrc/puppet-hazel"
github "hyperdock",             "1.0.0", :repo => "cmckendry/puppet-hyperdock"
github "imageoptim",            "0.0.2"
github "iterm2",                "1.2.5"
github "silverlight",           "1.0.1"
github "opera",                 "0.3.3"
github "spotify",               "1.0.2"
github "steam",                 "1.0.1"
github "teamviewer",            "1.0.1"
github "transmit",              "1.0.2"
github "virtualbox",            "1.0.13"
github "xscope",                "1.0.0"
github "xtrafinder",            "1.0.1"
github "caffeine",              "1.0.0"
github "prefpane",              "1.2.0", :repo => "indirect/puppet-prefpane"
github "sublime_text_3",        "1.0.3", :repo => "jozefizso/puppet-sublime_text_3"
github "skitch",                "1.0.3"
github "adobe_creative_cloud",  "1.0.0", :repo => "ngs/puppet-adobe_creative_cloud"
github "querious",              "0.0.1", :repo => "micalexander/puppet-querious"
