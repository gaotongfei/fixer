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
params = {target: 'USD', ammount: 200}

fixer.transfer(params)
```

```
$ 149.75
```

