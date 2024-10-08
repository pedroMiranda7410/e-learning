class Lesson <ApplicationRecord
    belongs_to :serie 
    has_many :comments
end 