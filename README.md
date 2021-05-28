# treegraft

This cookbook modifies file and directory resources in a resource collection to be rooted somewehere else in the filesystem as specified in the attribute `node['treegraft']['root']`. It does not matter where in the run list that `treegraft::default` appears, because it uses a Chef event handler that runs before the converge begins.

## Usage

Suppose you have a cookbook/run list with this resource:

```
file '/empty_file.txt' do
  action :touch
end
```

If you include `treegraft::default` in the runlist and set `node['treegraft']['root']` to `/arbitrary`, then Chef will touch the file `/arbitrary/empty_file.txt`.

## Use Case

The use case for which this cookbook was written is that of using a cookbook to manage files in source code repositories, which are typically not rooted at `/`.

## Libraries

This cookbook makes available a method `Treegraft.lookup_path` that can be used to create a list of places that a resources `source` property should check. See its source or tests for more details.

## Limitations

The event handler only modifies `Chef::Resource::File` and `Chef::Resource::Directory` (and their subclasses) resources. Other resources have a `path` property, but I haven't identified use cases for modifying their locations.
