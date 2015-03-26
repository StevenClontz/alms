require 'spec_helper'

describe Workbook do
  it 'has a unique hex_id' do
    workbook = build :workbook
    expect(workbook.hex_id).to be_nil
    workbook.save
    expect(workbook.hex_id).not_to be_nil
    another_workbook = create :workbook
    expect(workbook.hex_id).not_to equal(another_workbook.hex_id)
  end
end
