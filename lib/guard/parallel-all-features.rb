require "guard"
require "guard/guard"
require "guard-parallel_all/runner"

module Guard
  class ParallelAllFeatures < Guard
    def run_all
      ParallelAll::Runner.run "features", options
    end
    def run_on_change(paths)
      run_all
    end
  end
end
