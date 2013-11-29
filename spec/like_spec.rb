require 'spec_helper'

describe "like" do
  before(:each){ Post.delete_all }

  it "should check the database records" do
    Post.create(title: "Hello")
    Post.create(title: "World")
    Post.count.should == 2
    Post.where(:title).matches("%ello%").count.should == 1
  end

  it "should return records that start with string" do
    Post.create(title: "Hello")
    Post.create(title: "World")
    Post.where(:title).starts_with("Wor").count.should == 1
  end

  it "should not expose predicates to other classes" do
    Comment.create(message: "Hello")
    Comment.create(message: "World")
    expect{ Comment.where(:message).starts_with("Wor") }.to raise_error(NoMethodError)
  end
end