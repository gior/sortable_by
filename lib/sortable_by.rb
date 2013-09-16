require "sortable_by/version"

module SortableBy
  #attr_accessor :default_sort_direction do
  #  {
  #      :title => 'asc',
  #      :price => 'asc',
  #      :position => 'asc'
  #  }
  #end

  @default_sort_direction = {
        :title => 'asc',
        :price => 'asc',
        :position => 'asc'
    }

  def self.default_sort_direction
    @default_sort_direction
  end

  def self.default_sort_direction=(val)
    @default_sort_direction = val
  end

  def self.sort_by(query, attribute, direction=nil)
    direction ||= default_sort_direction[attribute]
    query.order("#{attribute.to_s} " + direction)
  end
end
