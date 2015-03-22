require 'spec_helper'

describe Workbook do
  it 'has a unique hex_id' do
    workbook = Workbook.new name: 'foo', description: 'bar'
    expect(workbook.hex_id).to be_nil
    workbook.save
    expect(workbook.hex_id).to_not be_nil
  end
end
