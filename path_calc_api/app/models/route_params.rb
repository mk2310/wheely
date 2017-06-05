class RouteParams
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :begin_lat,
                :begin_long,
                :end_lat,
                :end_long

  validates_presence_of :begin_lat
  validates_presence_of :begin_long
  validates_presence_of :end_lat
  validates_presence_of :end_long
end
