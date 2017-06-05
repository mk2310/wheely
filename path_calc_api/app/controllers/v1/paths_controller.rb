module V1
  class PathsController < ActionController::Base
    def new
      route_params = RouteParams.new(path_params)
      if route_params.valid?
        routes = GetRouteService.new(route_params).perform
        result = CalcPriceService.calc(routes)
        render json: { result: result }
      else
        render json: { error: route_params }
      end
    rescue StandardError => e
      render json: { error: e}
    end

    private

    def path_params
      params.permit(
        :begin_lat,
        :begin_long,
        :end_lat,
        :end_long
      )
    end
  end
end
