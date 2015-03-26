require 'spec_helper'

describe Assignment do
  it 'has a unique hex_id' do
    assignment = build :assignment
    expect(assignment.hex_id).to be_nil
    assignment.save
    expect(assignment.hex_id).to_not be_nil
  end
  it 'belongs to a workbook' do
    assignment = build :assignment, workbook: nil
    expect(assignment.valid?).to be_falsey
    assignment.workbook = create :workbook
    expect(assignment.valid?).to be_truthy
  end
end
