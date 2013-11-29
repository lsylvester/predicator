require 'spec_helper'

describe "Custom Predicates" do
  it "should return records that start with string" do
    Post.where(:title).starts_with("Wor").count.should == 1
  end

  it "should not expose predicates to other classes" do
    expect{ Comment.where(:message).starts_with("Wor") }.to raise_error(NoMethodError)
  end

  it "should be available to subclasses" do
    AwesomePost.where(:title).starts_with("Wor").count.should == 0
  end
end