require_relative 'lib/river_data'
require 'sinatra'
require 'pry'

get '/state/:code' do
  state_code = params[:code]

  resp = RiverData::State.find(state_code)
  filtered_data = Utils::GetTodaysValues.get(resp)

  Utils::GroupByRiver.group(filtered_data).to_json
end
