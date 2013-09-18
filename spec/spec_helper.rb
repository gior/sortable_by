require 'sortable_by'
require 'active_record'

require 'factory_girl_rails'
FactoryGirl.find_definitions

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :sortable_classes do |t|
    t.string  :title
    t.string  :code
  end
end
