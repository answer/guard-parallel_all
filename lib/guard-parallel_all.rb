require "guard"
require "guard/guard"
require "guard-parallel_all/version"

module Guard
  class ParallelAllSpec
  end
  class ParallelAllFeatures
  end

  module ParallelAll
    autoload :Runner, "guard-parallel_all/runner"
  end
end
