class Car < ActiveRecord::Base
  validates :name,
    presence: true
  validates :manufacturer,
    presence: true
  validates :color,
    presence: true
  validates :year,
    presence: true,
    numericality: { greater_than: 1920 },
    length: { is: 4 }
  validates :mileage,
    presence: true,
    numericality: { only_integer: true }
end
