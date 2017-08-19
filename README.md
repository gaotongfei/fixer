# Fixer

Fixer is a simple API wrapper of [http://fixer.io/](http://fixer.io/) to provide a clean way of converting currency

# Install

```
gem install 'fixer-rb'
```

# Usage

To convert Chinese Yuan to US Dollars, simply do this

```
require 'fixer'

fixer = Fixer::Request.new 'CNY'
params = {target: 'USD', ammount: 1000}

fixer.transfer(params)
$ 149.75
```

```
fixer.get_rate do |rate|
  rate.USD
end

$ 0.14975
```

# Supported Currencies

* CNY
* AUD
* BGN
* BRL
* CAD
* CHF
* CZK
* DKK
* GBP
* HKD
* HRK
* HUF
* IDR
* ILS
* INR
* JPY
* KRW
* MXN
* MYR
* NOK
* NZD
* PHP
* PLN
* RON
* RUB
* SEK
* SGD
* THB
* TRY
* USD
* ZAR
* EUR
