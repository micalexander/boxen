require 'spec_helper'

describe 'dotfiles::symlink' do
  let(:facts) { default_test_facts }
  let(:params) { {
    :dir    => '/test/boxen/src/dotfiles',
    :file   => '.example',
    :prefix => 'for/',
    :suffix => '.symlink',
  } }
  let(:title) { 'example' }

  it do
    should contain_file('/Users/testuser/.example').with({
      :ensure => 'link',
      :target => '/test/boxen/src/dotfiles/for/example.symlink',
    })
  end
end
