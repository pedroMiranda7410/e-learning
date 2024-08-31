class User < ApplicationRecord
  has_many :series, class_name:"Serie" 
  self.inheritance_column = :_type_disabled

  def self.students
    where(type: "Student")
  end

  def self.instructors
    where(type: "Instructor")
  end

  def is_instructor?
    type == 'Instructor'
  end 

  def is_student?
    type == 'Student'
  end 
end