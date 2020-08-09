
die "stdin is not interactive" unless STDIN.isatty

def die(msg)
  puts msg
  exit
end

def main
  puts 'hello'
end

main