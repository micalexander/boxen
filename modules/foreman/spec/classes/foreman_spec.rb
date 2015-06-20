require "spec_helper"

describe "foreman" do
  let(:facts) { default_test_facts }

  it do
    should contain_file("/test/boxen/foreman").with({
      :ensure => 'directory',
      :owner  => 'testuser'
    })

    should contain_exec("install foreman standalone").with({
      :cwd     => "/test/boxen/foreman",
      :user    => "testuser",
    })

    should contain_boxen__env_script("foreman")
    should contain_file("/test/boxen/env.d/foreman.sh").with_ensure('absent')
  end

  context "ensure => absent" do
    let(:params) { { :ensure => "absent" } }

    it do
      should contain_exec("uninstall foreman standalone").with({
        :command => "rm -rf /test/boxen/foreman"
      })
    end
  end

  context "Linux" do
    let(:facts) { default_test_facts.merge(:osfamily => "Linux") }

    it do
      should_not contain_file("/test/boxen/foreman")
      should_not contain_boxen__env_script("foreman")

      should contain_file("/usr/local/share/foreman").with({
        :ensure => "directory",
        :owner  => "root"
        })

      should contain_exec("install foreman standalone").with({
        :cwd     => "/usr/local/share/foreman",
        :user    => "root",
        })
    end
  end
end
