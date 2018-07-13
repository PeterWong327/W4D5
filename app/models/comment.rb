class Comment < ApplicationRecord
  belongs_to :location, polymorphic: true
end
