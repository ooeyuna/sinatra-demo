# frozen_string_literal: true

require 'erb'
def render(src, dest, opts)
  File.open(dest, 'w') do |f|
    f.write(ERB.new(File.read(src)).result_with_hash(opts))
  end
end
