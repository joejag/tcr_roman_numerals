require 'minitest/autorun'

class Urnfield 
  def convert(number)
    ones = number % 5
    fives = number / 5
    '/' * ones + '\\' * fives
  end
end

class Roman
  def convert(number)
    1
  end
end

class NumbersTest < Minitest::Test
  def test_urnfield
    assert '/' == Urnfield.new.convert(1)
    assert '//' == Urnfield.new.convert(2)
    assert '///' == Urnfield.new.convert(3)
    assert '////' == Urnfield.new.convert(4)
    assert_equal '\\', Urnfield.new.convert(5)
    assert_equal '/\\', Urnfield.new.convert(6)
    assert_equal '////\\\\\\\\\\', Urnfield.new.convert(29)
  end

  def test_roman
    assert_equal 1, Roman.new.convert(1)
  end
end