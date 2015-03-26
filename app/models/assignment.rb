class Assignment < ActiveRecord::Base
  include HasHexID
  belongs_to :workbook
  validates_presence_of :workbook
end
