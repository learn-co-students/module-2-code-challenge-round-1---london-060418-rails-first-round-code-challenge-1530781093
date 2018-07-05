class Heroine < ApplicationRecord
    validates  :super_name, presence: true, uniqueness:true
    belongs_to :power
end
