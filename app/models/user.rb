class User < ApplicationRecord
  has_many :series
  self.inheritance_column = :_type_disabled
end