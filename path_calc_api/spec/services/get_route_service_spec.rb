require 'spec_helper'

RSpec.describe GetRouteService do
  let(:params) do
    RouteParams.new(
      begin_lat: 0,
      begin_long: 0,
      end_lat: 1,
      end_long: 1
    )
  end

  let(:request_params) do
    {
      begin_lat: params.begin_lat,
      begin_long: params.begin_long,
      end_lat: params.end_lat,
      end_long: params.end_long
    }
  end

  describe '#request_params' do
    it 'should return params' do
      req_params = described_class.new(params).request_params
      expect(req_params).to eql(request_params)
    end
  end
end
