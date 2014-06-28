class Car < ActiveRecord::Base
  validates :manufacturer, presence: true
  validates :color, presence: true
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 1920}
  validates :mileage, presence: true, numericality: true
  validates :description, length: {maximum: 500}

  def year_valid?(year)
    year >= 1920
  end

end
