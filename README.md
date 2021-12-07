# ruby-etsy
Ruby HTTP parser

## Installation
Add this line to your application's Gemfile:

```
gem 'ruby-etsy', '1.0.0', require: 'ruby-etsy'
```

...followed with:
```
bundle install
```

Or install it with:
```
gem install ruby-etsy
```

## Usage
```
etsy = RubyEtsy.new(access_token: 'token', refresh_token: 'referesh_token', api_key: 'api_key', api_secret: 'secret')
```

The returned object is a Struct which has two parameters: `success?` and `hash_response`. e.g.

```
 #<struct :success?=true, hash_response={"userId"=>1, "id"=>1, "title"=>"delectus aut autem", "completed"=>false}> 
```

## Run tests

```
rspec spec
```

### Thank you for using RubyEtsy!


