require "test/unit"

require_relative '../../../main/ruby/powers_of_two_range/powers_of_two_range'

class PowersOfTwoRangeUnitTest < Test::Unit::TestCase
  def test_exclusive
    values = []
    PowersOfTwoRange.new(64).each do |value|
      values.push(value)
    end
    assert_equal([1, 2, 4, 8, 16, 32], values)
  end

  def test_exclusive_explicit
    values = []
    PowersOfTwoRange.new(64, inclusive: false).each do |value|
      values.push(value)
    end
    assert_equal([1, 2, 4, 8, 16, 32], values)
  end

  def test_inclusive
    values = []
    PowersOfTwoRange.new(64, inclusive: true).each do |value|
      values.push(value)
    end
    assert_equal([1, 2, 4, 8, 16, 32, 64], values)
  end

  def test_each
    values = []
    PowersOfTwoRange.new(71).each do |value|
      values.push(value)
    end
    assert_equal([1, 2, 4, 8, 16, 32, 64], values)
  end

  def test_each_with_index
    values = []
    indices = []
    PowersOfTwoRange.new(71).each_with_index do |value, index|
      values.push(value)
      indices.push(index)
    end
    assert_equal([1, 2, 4, 8, 16, 32, 64], values)
    assert_equal([0, 1, 2, 3, 4, 5, 6], indices)
  end

  def test_each_no_block
    values_as_enum = PowersOfTwoRange.new(71).each
    assert_equal([1, 2, 4, 8, 16, 32, 64], values_as_enum.to_a)
  end

  def test_each_with_index_no_block
    as_enum = PowersOfTwoRange.new(71).each_with_index
    assert_equal([[1,0], [2,1], [4,2], [8,3], [16,4], [32,5], [64,6]], as_enum.to_a)
  end
end

