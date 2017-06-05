require 'spec_helper'

RSpec.describe CalcPriceService do
  describe '#calc' do
    it 'should return range of prices or price ' do
      Rate.create!(
        name: 'business',
        name_ru: 'Бизнес',
        delivery_cost: 150,
        minimum_cost: 299,
        minute_cost: 15,
        km_cost: 38
      )
      price = described_class.calc([{ distance: '1', time: '1' }])
      expect(price).to eql(299)
      price = described_class.calc([{ 'distance' => '17', 'time' => '29' }])
      expect(price).to eql(1231)
      price = described_class.calc([{ 'distance' => '5', 'time' => '10' }, { 'distance' => '17', 'time' => '29' }])
      expect(price).to eql('490 - 1231')
    end
  end
end
