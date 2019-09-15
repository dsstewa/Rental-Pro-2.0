class Customer < ApplicationRecord
    has_many :rentals
    belongs_to :company
    has_many :equipment, through: :rentals

end
