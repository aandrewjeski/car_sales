class Car < ActiveRecord::Base
  validates :manufacturer,
    presence: true
  validates :color,
    presence: true
  validates :year,
    presence: true,
    :greater_than { 1920 },
    numericality: { only_integer: true },
    length: { is: 4 }
  validates :mileage
    presence: true,
    numericality: { only_integer: true }
end
