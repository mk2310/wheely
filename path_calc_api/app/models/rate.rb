class Rate < ActiveRecord::Base
  def cost(distance, time)
    [
      delivery_cost + (time * minute_cost) + (distance * km_cost),
      minimum_cost
    ].max
  end
end
