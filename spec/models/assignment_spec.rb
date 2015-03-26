require 'spec_helper'

describe Assignment do
  it 'has a unique hex_id' do
    assignment = Assignment.new name: 'foo', description: 'bar',
      workbook: Workbook.create(name: 'bar')
    expect(assignment.hex_id).to be_nil
    assignment.save
    expect(assignment.hex_id).to_not be_nil
  end
  it 'belongs to a workbook' do
    assignment = Assignment.new name: 'foo', description: 'bar'
    expect(assignment.valid?).to be_falsey
    assignment.workbook = Workbook.create name: 'Bazbook'
    expect(assignment.valid?).to be_truthy
  end
end
