class Rental < ApplicationRecord
    belongs_to :customer
    belongs_to :equipment

end
