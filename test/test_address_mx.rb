# encoding: utf-8

require File.dirname(__FILE__) + '/helper'

# Author: guapolo github.com/guapolo
class TestAddressMX < Test::Unit::TestCase
  def test_mx_state
    assert_match /[\sa-z]/i, Faker::AddressMX.state
  end

  def test_mx_state_abbr
    assert_match /[A-Z]/, Faker::AddressMX.state_abbr
  end

  def test_postal_code
    assert_match /[0-9]/, Faker::AddressMX.postal_code
  end

  def test_zip_code
    assert_match /[0-9]/, Faker::AddressMX.zip_code
  end

  def test_mx_municipality
    assert_match /[\sa-z]/i, Faker::AddressMX.municipality
  end
end
