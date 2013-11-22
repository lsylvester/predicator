# ActiveRecord::ColumnWhereChain

Adds column based query chains to ActiveRecord

## Installation

Add this line to your application's Gemfile:

    gem 'active_record-column_where_chain'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record-column_where_chain

## Usage

Start a where chain by passing in your column name to where as a symbol

    MyModel.where(:my_column)

Then call methods the query chain to get back to a relation

    MyModel.where(:my_column).like("%SomeValue%") #=> SELECT * from my_models where my_column like '%SomeValue'
    MyModel.where(:my_column).gt(10) #=> SELECT * from my_models where my_column > 10

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
