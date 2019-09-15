class Company < ApplicationRecord
    has_many :equipment
    has_many :users
    has_many :customers
    has_many :rentals, through: :equipment
end
