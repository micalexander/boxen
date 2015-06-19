class dropzone {
  package { 'dropzone':
    provider => 'compressed_app',
    source => 'https://aptonic.com/dropzone3/latest/Dropzone-3.2.0.zip'
  }
}
