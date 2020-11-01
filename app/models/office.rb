class Office < ApplicationRecord
    belongs_to :building
    belongs_to :company
    has_many :employees, through: :companies

end
