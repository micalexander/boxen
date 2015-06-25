require 'spec_helper'

describe 'dotfiles' do
  let(:facts) { default_test_facts }

  it do
    should contain_repository('/test/boxen/src/dotfiles').with_source('testuser/dotfiles')
  end

  context 'symlinks => array' do
    let(:params) { {
      :symlinks => ['example'],
    } }

    it do
      should contain_dotfiles__symlink('example').with({
        :dir     => '/test/boxen/src/dotfiles',
        :prefix  => '',
        :suffix  => '',
        :require => 'Repository[/test/boxen/src/dotfiles]',
      })
    end
  end

  context 'symlinks => hash' do
    let(:params) { {
      :symlinks    => {
        'example'  => {
          'prefix' => 'prefix',
          'suffix' => 'suffix',
        }
      }
    } }

    it do
      should contain_dotfiles__symlink('example').with({
        :dir     => '/test/boxen/src/dotfiles',
        :prefix  => 'prefix',
        :suffix  => 'suffix',
        :require => 'Repository[/test/boxen/src/dotfiles]',
      })
    end
  end

  context 'symlinks => undefined' do
    it { should have_dotfiles__symlink_resource_count(0) }
  end
end
