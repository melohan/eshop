require "zeitwerk"

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/models")
loader.setup