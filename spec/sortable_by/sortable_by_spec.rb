require 'spec_helper'

describe SortableBy do
  before(:all) do
  end

  before(:each) do
    SortableClass.default_sort_direction[:title] = 'asc'
    @sortable1 = FactoryGirl.create(:sortable_class, title: 'srt1')
    @sortable2 = FactoryGirl.create(:sortable_class, title: 'srt2')
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

  it "can be sorted in reverse order" do
    SortableClass.default_sort_direction[:title] = 'desc'
    result = SortableClass.sort_by @query, :title
    result.should == [@sortable2, @sortable1]
  end

  it "can be sorted in custom order" do
    SortableClass.default_sort_direction[:title] = 'desc'
    result = SortableClass.sort_by @query, :title, 'asc'
    result.should == [@sortable1, @sortable2]
  end
end