require 'river_data'

states = %w[
  AL
  AK
  AZ
  AR
  CA
  CO
  CT
  DE
  DC
  FL
  GA
  GU
  HI
  ID
  IL
  IN
  IA
  KS
  KY
  LA
  ME
  MD
  MA
  MI
  MN
  MS
  MO
  MT
  NE
  NV
  NH
  NJ
  NM
  NY
  NC
  ND
  MP
  OH
  OK
  OR
  PA
  PR
  RI
  SC
  SD
  TN
  TX
  UT
  VT
  VI
  VA
  WA
  WV
  WI
  WY
]
RSpec.describe RiverData::State do
  states.each do |state_code|
    context "when #{state_code} is passed in" do
      response = described_class.find(state_code)

      it "returns the rivers in #{state_code}" do
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
end
