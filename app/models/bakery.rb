class Bakery < ActiveRecord::Base
  # add association macro here
  has_many :baked_good
end
