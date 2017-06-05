class GetRouteService
  def initialize(obj)
    @route_params = obj
  end

  def perform
    uri = URI(api_url)
    uri.query = URI.encode_www_form(request_params)
    result = Net::HTTP.get_response(uri)
    return JSON.parse(result.body) if result.is_a?(Net::HTTPSuccess)
    raise StandardError.new('bad request')
  end

  def request_params
    {
      begin_lat: @route_params.begin_lat,
      begin_long: @route_params.begin_long,
      end_lat: @route_params.end_lat,
      end_long: @route_params.end_long
    }
  end

  def api_url
    Rails.configuration.route_api_url
  end
end
