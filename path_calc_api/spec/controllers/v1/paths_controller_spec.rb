require 'spec_helper'

RSpec.describe V1::PathsController, type: :controller do
  describe '#new' do
    let(:params) do
      {
        begin_lat: 0,
        begin_long: 0,
        end_lat: 1,
        end_long: 1
      }
    end

    it 'should return some attrs' do
      Rate.create!(
        name: 'business',
        name_ru: 'Бизнес',
        delivery_cost: 150,
        minimum_cost: 299,
        minute_cost: 15,
        km_cost: 38
      )
      allow_any_instance_of(GetRouteService).to receive(:perform)
        .and_return([{ 'distance' => '1', 'time' => '1' }])
      get :new, params: params
      expect(response.body).to eql({ result: 299 }.to_json)
    end
  end
end
