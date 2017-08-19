require "test_helper"

class FixerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Fixer::VERSION
  end

  def test_request_fixer
    response = Fixer::Request.new 'CNY'
    assert response.is_a? Fixer::Request
  end

  def test_transfer
    target = "USD"
    ammount = 200
    response = Fixer::Request.new 'CNY'
    json_response = JSON.parse response.response.body, symbolize_names: true
    data = {target: target, ammount: ammount}
    result = response.transfer(data)

    assert result.is_a? Numeric
    assert result, json_response[:rates][target.to_sym] * ammount
  end

  def test_rate
    target = "USD"
    base = "CNY"
    fixer = Fixer::Request.new base
    json_response = JSON.parse fixer.response.body, symbolize_names: true

    fixer.get_rate do |rate|
      assert rate.base, base
      assert rate.send(target), json_response[:rates][target.to_sym]
    end
  end
end
