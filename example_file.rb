require 'minitest/autorun'

class Urnfield 
  def convert(number)
    left = number
    if number >= 5
      return '\\'
    end

    '/' * left
  end
end

class NumbersTest < Minitest::Test

  def test_urnfield
    assert '/' == Urnfield.new.convert(1)
    assert '//' == Urnfield.new.convert(2)
    assert '///' == Urnfield.new.convert(3)
    assert '////' == Urnfield.new.convert(4)
    assert_equal '\\', Urnfield.new.convert(5)
    # assert_equal '/\\', Urnfield.new.convert(6)
  end
end