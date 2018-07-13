class Goal < ApplicationRecord
    has_many :comments, as: :location
end
