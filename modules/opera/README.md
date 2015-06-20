# Opera Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-opera.png?branch=master)](https://travis-ci.org/boxen/puppet-opera)

Install [Opera](http://www.opera.com/), the alternative web browser

## Usage

```puppet
include opera

# for Opera Developer
include opera::developer

# for Opera Mobile Classic Emulator
include opera::mobile

# for Opera Mail
include opera::mail
```

## Required Puppet Modules

* `boxen >= 2.3.1`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
