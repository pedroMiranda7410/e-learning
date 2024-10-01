class Serie < ApplicationRecord
  belongs_to :user
  has_many :lessons 

  def author
    return user
  end 
end
