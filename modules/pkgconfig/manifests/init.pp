class pkgconfig {
  package {
    'gettext': ;
    'pkg-config':
      require => Package['gettext'];
  }
}
