module Fixer
  class Request
    attr_reader :response
    def initialize(base = Fixer.base)
      @base = base
      base_host = "https://api.fixer.io/latest?base=#{base}"
      @response = HTTParty.get(base_host)
    end

    def transfer(data)
      if data.is_a? Hash
        if [:target, :ammount].all? { |k| data.key? k }
          target = data[:target]
          if (valid_currency?(target)) && data[:ammount].is_a?(Numeric)
            result = JSON.parse @response.body, symbolize_names: true
            data[:ammount] * result[:rates][target.to_sym]
          else
            raise "current currency is not supported or ammount set to an non-integer value"
          end
        end
      else
        raise "only hash allowed"
      end
    end

    def get_rate
      result = JSON.parse @response.body, symbolize_names: true
      base = {base: @base}
      rates = result[:rates]
      currencies = base.merge(rates)
      r_obj = OpenStruct.new currencies
      yield r_obj
    end

    private
    def valid_currency?(currency)
      valid_currencies = ["EUR", "AUD", "BGN", "BRL", "CAD", "CHF", "CNY",
                          "CZK", "DKK", "GBP", "HKD", "HRK", "HUF", "IDR",
                          "ILS", "INR", "JPY", "KRW", "MXN", "MYR", "NOK",
                          "NZD", "PHP", "PLN", "RON", "RUB", "SEK", "SGD",
                          "THB", "TRY", "USD", "ZAR"]
      valid_currencies.include? currency
    end

  end
end
