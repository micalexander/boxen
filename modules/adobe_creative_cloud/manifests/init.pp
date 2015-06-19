class adobe_creative_cloud {
  package { 'Adobe Creative Cloud':
    source   => 'https://ccmdls.adobe.com/AdobeProducts/KCCC/1/osx10/CreativeCloudInstaller.dmg',
    provider => 'appdmg'
  }
}
