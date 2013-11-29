require 'spec_helper'

describe "like" do

  it "should check the database records" do
    Post.count.should == 2
    Post.where(:title).matches("%ello%").count.should == 1
  end

  it "should return records that start with string" do
    Post.where(:title).starts_with("Wor").count.should == 1
  end

  it "should not expose predicates to other classes" do
    expect{ Comment.where(:message).starts_with("Wor") }.to raise_error(NoMethodError)
  end
end