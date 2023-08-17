require_relative 'lib/river_data'
require 'sinatra'
require 'pry'
require 'sinatra/cross_origin'

configure do
  enable :cross_origin
end

get '/state/:code' do
  state_code = params[:code]

  resp = RiverData::State.find(state_code)
  filtered_data = Utils::GetTodaysValues.get(resp)

  Utils::GroupByRiver.group(filtered_data).to_json
end
