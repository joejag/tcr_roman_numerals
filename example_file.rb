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
    base = {1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V',
            6 => 'VI', 7 => 'VII'}
    base[number]
  end
end

class NumbersTest < Minitest::Test

  def test_roman
    assert_equal 'I', Roman.new.convert(1)
    assert_equal 'II', Roman.new.convert(2)
    assert_equal 'III', Roman.new.convert(3)
    assert_equal 'IV', Roman.new.convert(4)
    assert_equal 'V', Roman.new.convert(5)
    assert_equal 'VI', Roman.new.convert(6)
    assert_equal 'VII', Roman.new.convert(7)
    # assert_equal 'VIII', Roman.new.convert(8)
    # assert_equal 'IV', Roman.new.convert(9)
    # assert_equal 'X', Roman.new.convert(10)
  end
  
  def test_urnfield
    assert '/' == Urnfield.new.convert(1)
    assert '//' == Urnfield.new.convert(2)
    assert '///' == Urnfield.new.convert(3)
    assert '////' == Urnfield.new.convert(4)
    assert_equal '\\', Urnfield.new.convert(5)
    assert_equal '/\\', Urnfield.new.convert(6)
    assert_equal '////\\\\\\\\\\', Urnfield.new.convert(29)
  end
end