bash "create swap file #{node['setup']['swapfile_name']}" do
  user 'root'
  code <<-EOC
    fallocate -l #{node['setup']['swapfile_size_mb']}M #{node['setup']['swapfile_name']}
    mkswap #{node['setup']['swapfile_name']}
    chown root:root #{node['setup']['swapfile_name']}
    chmod 0600 #{node['setup']['swapfile_name']}
  EOC
  creates node['setup']['swapfile_name']
end

mount 'swap' do
  action :enable
  device node['setup']['swapfile_name']
  fstype 'swap'
end

bash 'activate all swap devices' do
  user 'root'
  code 'swapon -a'
end
