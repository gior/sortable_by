require 'spec_helper'



describe SortableBy do
  before(:each) do
    SortableBy.default_sort_direction[:title] = 'asc'
    @SortableBy1 = FactoryGirl.build(:sortable_by, :title => 'srt1')
    @SortableBy2 = FactoryGirl.build(:sortable_by, :title => 'srt2')
    @query = SortableBy.where("title LIKE 'srv%'")
  end

  it "can be sorted" do
    result = SortableBy.sort_by @query, :title
    result.should == [@SortableBy1, @SortableBy2]
  end

  it "can be sorted in reverse order" do
    SortableBy.default_sort_direction[:title] = 'desc'
    result = SortableBy.sort_by @query, :title
    result.should == [@SortableBy2, @SortableBy1]
  end

  it "can be sorted in custom order" do
    SortableBy.default_sort_direction[:title] = 'desc'
    result = SortableBy.sort_by @query, :title, 'asc'
    result.should == [@SortableBy1, @SortableBy2]
  end
end