#
# Cookbook Name:: npm_packages
# Recipe:: default
#
 
node_version = `node -v`.match(/\d+\.\d+\.\d+/).to_s
 
node[:npm_packages].each do |package|
 
  ey_cloud_report "npm-package-install" do
    message "Installing #{package[:name]}"
  end
 
  execute "Install npm package globally" do
    command "sudo npm install -g #{package[:name]}"
  end
 
  if package[:command]
    execute  "symlink command" do
      command "ln -fs /opt/nodejs/#{node_version}/bin/#{package[:command]} /usr/local/bin/#{package[:command]}"
      not_if { FileTest.exists?("/usr/bin/#{package[:command]}") }
    end
  end
 
end
