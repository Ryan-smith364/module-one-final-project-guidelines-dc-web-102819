class Location < ActiveRecord::Base
    has_many :courses
    belongs_to :courses

end