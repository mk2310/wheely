class CalcPriceService
  def self.calc(routes)
    result = []
    rate = Rate.where(name: 'business').first
    routes.each do |route|
      result << rate.cost(route['distance'].to_i, route['time'].to_i)
    end
    return result.minmax.join(' - ') if result.size > 1
    result.first
  end
end
