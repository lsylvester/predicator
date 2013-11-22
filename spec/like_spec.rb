require 'spec_helper'

describe "like" do
  it "should check the database records" do
    Post.create(title: "Hello")
    Post.create(title: "World")
    Post.count.should == 2
    Post.where(:title).matches("%ello%").count.should == 1
  end
end