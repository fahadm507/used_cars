class Car < ActiveRecord::Base
  validates :manufacturer, presence: true
  validates :color, presence: true
  validates :year, presence: true, numericality: true
  validates :mileage, presence: true, numericality: true
  validates :description, length: {maximum: 500}
end
