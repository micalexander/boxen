# 1Password Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-onepassword.png?branch=master)](https://travis-ci.org/boxen/puppet-onepassword)

## Usage

To install [1Password 5](https://agilebits.com/onepassword) use the following snippet inside your manifest file:

```puppet
include onepassword
```

If you also want to install the [1Password Chrome extension](https://agilebits.com/onepassword/extensions) add the following underneath the snippet above:

```puppet
include onepassword::chrome
```

**Note:** For the above snippet to work you must be installing the main channel release of Chrome via Boxen.

## Required Puppet Modules

* boxen
* stdlib
