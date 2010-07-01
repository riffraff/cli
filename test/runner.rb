require 'test/unit'

OLD_DIR= Dir.pwd
class TestCli < Test::Unit::TestCase
  def setup
    p "here"
    Dir.chdir OLD_DIR
  end

  Dir["test/0*"].each do |d|
    define_method d.sub("/","_") do
      Dir.chdir(d)
      command = File.read('command')
      output= `#{command}`
      expected = File.read('output')
      assert_equal expected.chomp.strip, output.chomp.strip
    end
  end
end
