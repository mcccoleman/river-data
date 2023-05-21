require 'river_data'

RSpec.describe RiverData::LatitudeLongitude do
  context 'when coordinates are passed in' do
    response = described_class.find(-83.000000, 36.500000, -81.000000, 38.500000)

    it 'returns the rivers within those coordinates' do
      expect(response['value']['timeSeries']).to_not eq(0)
    end
    it 'returns a name field' do
      expect(response['name']).to eq('ns1:timeSeriesResponseType')
    end
    it 'returns a declaredType field' do
      expect(response['declaredType']).to eq('org.cuahsi.waterml.TimeSeriesResponseType')
    end
    it 'returns a scope field' do
      expect(response['scope']).to eq('javax.xml.bind.JAXBElement$GlobalScope')
    end
  end
end
