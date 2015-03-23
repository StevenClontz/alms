class Workbook < ActiveRecord::Base
  include HasHexID
  extend Searchable
end
