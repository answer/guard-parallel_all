# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard-parallel_all/version"

Gem::Specification.new do |s|
  s.name        = "guard-parallel_all"
  s.version     = Guard::ParallelAll::VERSION
  s.authors     = ["sakai shunsuke"]
  s.email       = ["sakai@ans-web.co.jp"]
  s.homepage    = "https://github.com/answer/guard-parallel_all"
  s.summary     = %q{parallel:[spec|features] する guard}
  s.description = %q{run_all ファイルを監視して、 parallel タスクを起動する}

  s.rubyforge_project = "guard-parallel_all"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "guard"
end
