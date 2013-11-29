ActiveRecord::Base.connection.create_table(:comments, force: true) do |t|
  t.string :message
end

class Comment < ActiveRecord::Base
end