class Golfer < ActiveRecord::Base
   has_many :reviews
    has_many :courses, through: :reviews
    

end