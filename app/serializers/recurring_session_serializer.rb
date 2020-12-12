class RecurringSession < ActiveModel::Serializer
  has_many :sessions
  attributes :id, :name, :day_of_week
end
