module Treegraft
  def lookup_path(file, *parts, **options)
    delimiter = options[:delimiter] || '/'
    list = []
    until parts.empty?
      list.push('/' << parts.join(delimiter) << '/')
      parts.pop
    end
    list << '/default/' << '/'
    list.collect { |path| ::File.join(path, file) }
  end

  extend self
end
