class User < ApplicationRecord
  self.inheritance_column = :_type_disabled
end