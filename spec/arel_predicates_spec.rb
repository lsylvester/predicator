require 'spec_helper'

describe "Arel Predicates" do

  it "should check the database records" do
    Post.count.should == 2
    Post.where(:title).matches("%ello%").count.should == 1
  end


  it "should work on joined tables" do
    Post.first.comments.create
    Comment.joins(:post).merge(Post.where(:title).matches("Hel%")).count.should == 1
    Comment.joins(:post).where('posts.title').matches("Hel%").count.should == 1
  end
end