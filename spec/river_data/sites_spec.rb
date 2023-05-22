require 'river_data'

RSpec.describe RiverData::Sites do
  context 'when invalid site is passed in' do
    response = described_class.find(['001646500q3rwer'])

    it 'returns the error code status' do
      expect(response[:status]).to eq(400)
    end
    it 'returns the message' do
      expect(response[:message]).to_not eq(nil)
    end
  end
  context 'when a site is passed in' do
    response = described_class.find(['001646500'])

    it 'returns the rivers at that site' do
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
  context 'when multiple sites are passed' do
    response = described_class.find(%w[01646500 02342500])

    it 'returns the rivers at those sites' do
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
