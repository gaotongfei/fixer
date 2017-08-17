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
end
