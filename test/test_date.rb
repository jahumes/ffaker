# => Author: Vitor Oliveira <vitormil@gmail.com>
# => Transfered By: Anthony Humes <jah.humes@gmail.com>

require 'helper'

class TestFakerDate < Test::Unit::TestCase
  def setup
    @tester = Faker::Date
  end

  def test_between
    from = Date.parse("2012-01-01")
    to   = Date.parse("2013-01-01")

    100.times do
      random_date = @tester.between(from, to)
      assert random_date >= from, "Expected >= \"#{from}\", but got #{random_date}"
      assert random_date <= to  , "Expected <= \"#{to}\", but got #{random_date}"
    end
  end

  def test_forward
    today = Date.today

    100.times do
      random_date = @tester.forward(5)
      assert random_date > today, "Expected > \"#{today}\", but got #{random_date}"
    end
  end

  def test_backward
    today = Date.today

    100.times do
      random_date = @tester.backward(5)
      assert random_date < today, "Expected < \"#{today}\", but got #{random_date}"
    end
  end

  def test_return_type
    random_forward  = @tester.forward(5)
    random_backward = @tester.backward(5)
    random_between  = @tester.between(Date.today, Date.today + 5)

    [random_forward, random_backward, random_between].each do |result|
      assert result.is_a?(Date), "Expected a Date object, but got #{result.class}"
    end
  end

  def test_invalid_date
    assert_raise TypeError do
      @tester.between("9999-99-99", "9999-99-99")
    end
  end
end