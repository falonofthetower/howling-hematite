require 'spec_helper'

RSpec.describe MapObject, type: :MapObject do
  describe '.format' do
    it 'returns the title in bold h2' do
      location = Fabricate.build(:crash_location, title: "lowercase text")

      result = MapObject.new(location).format

      expect(result[:title]).to eq("<b><h2>lowercase text</h2></b>")
    end

    it 'returns the latitude' do
      location = Fabricate.build(:crash_location, lat: 42)

      result = MapObject.new(location).format

      expect(result[:lat]).to eq(42)
    end

    it 'returns the longitude' do
      location = Fabricate.build(:crash_location, lng: 23)

      result = MapObject.new(location).format

      expect(result[:lng]).to eq(23)
    end

    it 'returns the content correctly' do
      location = Fabricate.build(:crash_location, title: "Fake Title", url_title: "Fake Url", url_address: "http://example.com", date: "2017/12/1", content: "Fake Content")

      result = MapObject.new(location).format

      expect(result[:content]).to eq ("<b><h2>Fake Title</h2></b><h3>2017-12-01</h3><p>Fake Content</p><p>More Info: <a href='http://example.com'>Fake Url</a></p>")
    end
  end
end
