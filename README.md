# Fixer

[![Build Status](https://travis-ci.org/gaotongfei/fixer.svg?branch=master)](https://travis-ci.org/gaotongfei/fixer)

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

fixer.transfer(params)  # 149.75
$ 149.75
```

Get currency rate
```
fixer.get_rate do |rate|
  usd = rate.USD  # 0.14975
  rate_in_hash = rate.to_h
  rate_in_json = rate.to_json
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
