require 'river_data'

RSpec.describe RiverData::Counties do
  context 'when invalid county codes are passed in' do
    response = described_class.find(['510242359'])

    it 'returns the error code status' do
      expect(response[:status]).to eq(400)
    end
    it 'returns the message' do
      expect(response[:message]).to_not eq(nil)
    end
  end
  context 'when a county code is passed in' do
    response = described_class.find(['51059'])

    it 'returns the rivers in that county' do
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
  context 'when multiple counties are passed in' do
    response = described_class.find(%w[51059,51061])

    it 'returns the rivers at those counties' do
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
