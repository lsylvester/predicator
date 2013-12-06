ActiveRecord::Base.connection.create_table(:comments, force: true) do |t|
  t.string :message
  t.integer :post_id
end

class Comment < ActiveRecord::Base
  belongs_to :post
end