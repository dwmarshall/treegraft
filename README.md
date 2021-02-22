# treegraft

This cookbook modifies file and directory resources in a resource collection to be rooted somewehere else in the filesystem as specified in the attribute `node['treegraft']['root']`. It does not matter where in the run list that `treegraft::default` appears, because it uses a Chef event handler that runs before the converge begins.

## Use Case

The use case for which this cookbook was written is that of using a cookbook to manage files in source code repositories, which are typically not rooted at `/`.
