class Tree < ApplicationRecord
  belongs_to :type
  belongs_to :location
  belongs_to :diameter
end
