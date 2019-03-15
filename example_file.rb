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
            6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX', 10 => 'X'}
    return base[number] if base.has_key? number

    answer = ''
    remaining = number
    while !base.has_key? remaining
      highest_known = base.keys.sort.reverse
      while highest_known[0] > remaining
        highest_known.shift!
      end
      answer += base[highest_known[0]]
      remaining -= highest_known[0]
    end
    return answer + base[remaining]
  end
end

class NumbersTest < Minitest::Test

  def test_roman_low
    examples = { 'I' => 1, 'II' => 2, 'III' => 3, 'IV' => 4, 'V' => 5, 
    'VI' => 6, 'VII' => 7, 'VIII' => 8, 'IX' => 9, 'X' => 10 }
    examples.each {|k,v| assert_equal k, Roman.new.convert(v) }
  end

  def test_roman_teens
    examples = {'XI' => 11, 'XII' => 12, 'XIII' => 13, 'XIV' => 14, 'XV' => 15, 
    'XVI' => 16, 'XVII' => 17, 'XVIII' => 18, 'XIX' => 19, 'XX' => 20}
    examples.each {|k,v| assert_equal k, Roman.new.convert(v) }
  end

  def test_roman_harder
    examples = {'XXV' => 25}
    examples.each {|k,v| assert_equal k, Roman.new.convert(v) }
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