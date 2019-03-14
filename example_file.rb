require 'minitest/autorun'

class Urnfield 
  def convert(number)
    '/' * number
  end
end

class NumbersTest < Minitest::Test

  def test_urnfield
    assert '/' == Urnfield.new.convert(1)
    # assert "//" == Urnfield.new.convert(2)
  end
end