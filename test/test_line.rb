$LOAD_PATH << File.expand_path('../../lib', __FILE__)

require 'stringio'
require 'minitest'
require 'minitest/rails/capybara'
require 'minitest/autorun'
require 'minitest/mock'

class LineExample < Minitest::Test
  def test_hello
    p :hello
  end

  def test_world
    p :world
  end
end

Minitest::Runnable.runnables.delete(LineExample)

class TestLine < Minitest::Test
  def run_class(klass, args = [])
    Minitest::Runnable.stub :runnables, [klass] do
      $stdout = io = StringIO.new
      Minitest.run(args)
      $stdout = STDOUT
      io.string
    end
  end

  def test_line
    (9..12).each do |line|
      output = run_class LineExample, ['--line', line.to_s]
      assert_match /1 runs/, output
      assert_match /:hello/, output
      refute_match /:world/, output
    end

    (13..45).each do |line|
      output = run_class LineExample, ['--line', line.to_s]
      assert_match /1 runs/, output
      assert_match /:world/, output
      refute_match /:hello/, output
    end
  end

  def test_before
    assert_raises(RuntimeError) do
      run_class LineExample, ['--line', '8']
    end
  end
end

