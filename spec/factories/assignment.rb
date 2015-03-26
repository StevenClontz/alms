FactoryGirl.define do
  factory :assignment do
    name "Group 20XX"
    description "assignment of these notes to my small group"
    workbook { create(:workbook) }
  end
end