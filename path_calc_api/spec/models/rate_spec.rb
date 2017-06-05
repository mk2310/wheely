require 'spec_helper'

RSpec.describe Rate, type: :model do
  describe '#cost' do
    it 'should return cost' do
      Rate.create!(
        name: 'business',
        name_ru: 'Бизнес',
        delivery_cost: 150,
        minimum_cost: 299,
        minute_cost: 15,
        km_cost: 38
      )
      expect(Rate.first.cost(17, 27)).to eql(1201)
    end
  end
end
