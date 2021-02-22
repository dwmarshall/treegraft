describe file('/subtree/absolutedir/somefile') do
  it { should exist }
end

describe file('/subtree/relativedir/otherfile') do
  it { should exist }
end
