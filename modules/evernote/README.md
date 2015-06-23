# Evernote Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-evernote.png?branch=master)](https://travis-ci.org/boxen/puppet-evernote)

## Usage

To use the latest version of Evernote:
```puppet
include evernote
```

To use a specific version of Evernote:
```puppet
class { 'evernote':
  sourceUri => 'https://cdn1.evernote.com/mac-smd/public/Evernote_RELEASE_5.6.0_450741.dmg'
}
```


## Required Puppet Modules

* boxen

