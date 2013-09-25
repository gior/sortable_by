require "sortable_by/version"
require 'active_record'

module SortableBy
  @@default_sort_direction = { }

  def default_sort_direction
    @@default_sort_direction
  end

  def default_sort_direction=(val)
    @@default_sort_direction = val
  end

  def sortable_by(attribute, direction = 'asc')
    @@default_sort_direction[attribute] = direction
  end

  def sort_by(attribute, direction=nil, query=self)
    direction ||= default_sort_direction[attribute]
    query.order("#{attribute.to_s} " + direction)
  end

  ActiveRecord::Base.extend SortableBy
end