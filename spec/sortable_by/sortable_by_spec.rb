require 'spec_helper'

describe SortableBy do
  before(:all) do

    class SortableClass < ActiveRecord::Base
      #extend SortableBy
      sortable_by :title
      sortable_by :code, 'desc'
    end

  end

  before(:each) do
    #SortableClass.default_sort_direction[:title] = 'asc'
    @sortable1 = FactoryGirl.create(:sortable_class, title: 'srt1', code: '1st')
    @sortable2 = FactoryGirl.create(:sortable_class, title: 'srt2', code: '2nd')
    @query = SortableClass.where("title LIKE 'srt%'")
  end

  after(:each) do
    SortableClass.all.each do |s|
      s.delete
    end
  end

  it "can be sorted" do
    result = SortableClass.sort_by @query, :title
    result.should == [@sortable1, @sortable2]
  end

  it "can be sorted in descending order" do
    # if :code has been defined with descending order
    result = SortableClass.sort_by @query, :code
    result.should == [@sortable2, @sortable1]
  end

  it "can be sorted in custom order" do
    # we can overrride the default set in the class declaration
    result = SortableClass.sort_by @query, :code, 'asc'
    result.should == [@sortable1, @sortable2]
  end

  it "can set the default order for ONE attribute at a time" do
    #all has been done in the class definition using sortable_by :title
    SortableClass.default_sort_direction[:title].should == 'asc'
  end
end