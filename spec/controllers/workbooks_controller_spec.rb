require 'spec_helper'

describe WorkbooksController do
  render_views
  describe "index" do
    before do
      Workbook.create!(name: 'Calculus I')
      Workbook.create!(name: 'Calculus III Part 1')
      Workbook.create!(name: 'Calculus III Part 2.0')
      Workbook.create!(name: 'Calculus III Part Tres')

      xhr :get, :index, name: name_query
    end

    subject(:results) { JSON.parse(response.body) }

    names_from_results = lambda {|object| object["name"]}

    context "when no keyword specified" do
      let(:name_query) { nil }
      it 'should 200' do
        expect(response.status).to eq(200)
      end
      it 'should return correct number of results' do
        expect(results.size).to eq(4)
      end
      it "should include appropriate name" do
        expect(results.map(&names_from_results)).to(
          include('Calculus III Part 2.0')
        )
      end
    end

    context "when keyword specified" do
      let(:name_query) { 'Part' }
      it 'should 200' do
        expect(response.status).to eq(200)
      end
      it 'should return correct number of results' do
        expect(results.size).to eq(3)
      end
      it "should include appropriate name" do
        expect(results.map(&names_from_results)).to(
          include('Calculus III Part Tres')
        )
      end
    end

    context "when the search doesn't find results" do
      let(:name_query) { 'fooasdghia' }
      it 'should return no results' do
        expect(results.size).to eq(0)
      end
    end

  end
end