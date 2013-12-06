ActiveRecord::Base.connection.create_table(:posts, force: true) do |t|
  t.string :title
  t.string :type
end

class Post < ActiveRecord::Base
  has_many :comments
  predicate :starts_with do |column, value|
    column.matches("#{value}%")
  end
end

class AwesomePost < Post
end

Post.create(title: "Hello")
Post.create(title: "World")