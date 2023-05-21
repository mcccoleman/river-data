require 'river_data'

RSpec.describe RiverData::HydrolicUnitCodes do
  context 'when a hydrolic unit code is passed in is passed in' do
    response = described_class.find(['02070010'])

    it 'returns the rivers at that hydrolic unit code' do
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
  context 'when multiple unit codes are passed in is passed in' do
    response = described_class.find(%w[02070010 01010001])

    it 'returns the rivers at that unit code' do
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
