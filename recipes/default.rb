#
# Cookbook:: treegraft
# Recipe:: default
#
# Copyright:: 2021, Verizon Media Group, All Rights Reserved.
require 'pathname'

directory Chef.node['treegraft']['root'] do
  not_if { ::Dir.exist? Chef.node['treegraft']['root'] }
  action :nothing
end.run_action(:create)

Chef.event_handler do
  on :converge_start do
    root = Pathname.new('/')
    new_root = Pathname.new(Chef.node['treegraft']['root'])
    unless root == new_root
      Chef.run_context.resource_collection.each do |resource|
        next unless resource.is_a?(Chef::Resource::File) || resource.is_a?(Chef::Resource::Directory)
        this_path = Pathname.new(resource.path)
        if this_path.absolute?
          this_path = this_path.relative_path_from(root)
        end
        resource.path = (new_root + this_path).to_s
      end
    end
  end
end
