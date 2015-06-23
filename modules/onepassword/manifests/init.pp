# Install 1Password into /Applications
# Install Chrome extension via update URL
#
# Usage:
#
#     include onepassword
class onepassword {
  $host = 'd13itkw33a7sus.cloudfront.net'
  $path = 'dist/1P/mac4/1Password-5.0.2.zip'

  package { '1Password 5':
    source   => "https://${host}/${path}",
    provider => 'compressed_app'
  }
}
