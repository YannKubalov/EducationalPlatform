class Discipline < ApplicationRecord
    has_many :materials, dependent: :destroy
end
