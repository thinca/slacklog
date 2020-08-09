def silent(&block)
  $stderr = StringIO.new
  block.call
ensure
  $stderr = STDERR
end

def traverse(ast, &block)
  yield ast
  ast.children.each do |child|
    traverse(child, &block) if child.is_a?(Parser::AST::Node)
  end
end

def include_loc?(range:, line:, col:)
  start_line = range.line
  end_line = range.last_line
  start_col = range.column
  end_col = range.last_column


  (start_line < line || (start_line == line && start_col <= col)) &&
    (line < end_line || (line == end_line && col <= end_col))
end

def range(node, key)
  node.loc.respond_to?(key) && node.loc.__send__(key)
end

silent do
  require 'parser/ruby26'
end

line = Integer ARGV[0]
col = Integer ARGV[1]
code = ARGV[2].then { |f| File.read(f) } || $stdin.read

ast = Parser::Ruby26.parse(code)

traverse(ast) do |node|
  keyword_range = range(node, :keyword) || range(node, :begin)
  next unless keyword_range
  end_range = range(node, :end)
  next unless end_range
  ranges = {
    keyword: keyword_range,
    end: end_range,
  }

  ranges.each do |key, range|
    if include_loc?(range: range, line: line, col: col)
      r = ranges[key == :keyword ? :end : :keyword]
      p [r.line, r.column]
      exit
    end
  end
end
