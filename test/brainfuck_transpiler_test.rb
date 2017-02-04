require 'test_helper'

class TestBrainfuckTranspiler < Minitest::Test
  def test_get_H
    transpiler = BrainfuckTranspiler.new("puts 'H'")
    result = transpiler.get_brainfuck_code

    assert_equal "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.", result
  end

  def test_get_a_space
    transpiler = BrainfuckTranspiler.new("puts '  '")
    result = transpiler.get_brainfuck_code

    assert_equal "++++++++++++++++++++++++++++++++..", result
  end
end
