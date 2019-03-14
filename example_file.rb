require 'minitest/autorun'

class Urnfield 
  def convert(number)
    '/' * number
  end
end

class NumbersTest < Minitest::Test

  def test_urnfield
    assert '/' == Urnfield.new.convert(1)
    assert '//' == Urnfield.new.convert(2)
    assert '///' == Urnfield.new.convert(3)
    assert '////' == Urnfield.new.convert(4)
    # assert '\\' == Urnfield.new.convert(5)
  end
end