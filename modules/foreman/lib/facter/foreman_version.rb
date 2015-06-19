Facter.add("foreman_version") do
  foreman_path = "#{Facter[:boxen_home].value}/foreman/bin/foreman"
  if File.executable?(foreman_path)
    setcode "#{foreman_path} version 2>&1"
  end
end
