# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name     = "minitest-line"
  s.version  = "0.5.0"
  s.date     = "2014-03-01"
  s.summary  = "Focused tests for Minitest"
  s.email    = "judofyr@gmail.com"
  s.homepage = "https://github.com/judofyr/minitest-line"
  s.authors  = ['Magnus Holm']
  
  s.description = s.summary
  
  s.files         = Dir['{test,lib}/**/*']
  s.test_files    = Dir['test/**/*']

  s.add_runtime_dependency('minitest')
end
