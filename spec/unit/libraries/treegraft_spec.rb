require 'spec_helper'

describe Treegraft do
  describe '.lookup_path' do
    it 'defaults to two items' do
      expect(described_class.lookup_path('foo')).to eq(['/default/foo', '/foo'])
    end
  end

  it 'handles one component' do
    expect(described_class.lookup_path('bar', 'path1'))
      .to eq(['/path1/bar', '/default/bar', '/bar'])
  end

  it 'handles multiple components' do
    expect(described_class.lookup_path('baz', 'path1', 'path2'))
      .to eq(['/path1/path2/baz', '/path1/baz', '/default/baz', '/baz'])
  end

  it 'discards nil components' do
    expect(described_class.lookup_path('blort', nil, nil))
      .to eq(['/default/blort', '/blort'])
  end

  it 'can accept a different delimiter' do
    expect(described_class.lookup_path('frotz', 'path1', 'path2', delimiter: '-'))
      .to eq(['/path1-path2/frotz', '/path1/frotz', '/default/frotz', '/frotz'])
  end
end
