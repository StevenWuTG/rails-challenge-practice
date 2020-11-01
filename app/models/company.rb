class Company < ApplicationRecord
    has_many :offices
    has_many :employees
    has_many :buildings, through: :offices 
    accepts_nested_attributes_for :employees
    accepts_nested_attributes_for :offices
end
