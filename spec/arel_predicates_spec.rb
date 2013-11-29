require 'spec_helper'

describe "Arel Predicates" do

  it "should check the database records" do
    Post.count.should == 2
    Post.where(:title).matches("%ello%").count.should == 1
  end
end