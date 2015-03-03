# Nanika

Nanika は 何かを定義したDSLをDSLを処理する処理系に受け渡すためのユーティリティです。

テキストファイルのDSLをオブジェクトに変換して処理にそのまま渡します。

何かを受け取った後の処理は自分で記述する必要があります。

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nanika', :git => 'git@github.com:sumipan/nanika.rb.git', :branch => 'master'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nanika

## Usage

定義済み

- User
- Team
- BaseBallItem
- CardItem

```text
sumipan = User.new('すみぱん')
sumipan.take_gift(GameItem.new('1000'))
sumipan.take_gift(GameItem.new('1000'))
sumipan.take_gift(GameItem.new('1000'))
sumipan.take_gift(GameItem.new('1000'))
```

```ruby
reauire 'nanika'

class User
  :attr_accessor :name
  
  def initialize(name)
  end
end

Nanika.proc do |context|
end
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/nanika/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
