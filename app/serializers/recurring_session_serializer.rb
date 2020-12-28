class RecurringSessionSerializer < ActiveModel::Serializer
  has_many :sessions
  attributes :id, :name, :day_of_week, :low_rating_limit, :high_rating_limit
end
