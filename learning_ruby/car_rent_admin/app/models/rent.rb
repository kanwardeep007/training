class Rent < ApplicationRecord
  has_one :client
  has_one :car
  belongs_to :claim
  
end
