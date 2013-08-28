class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

   validates_length_of :name, maximum: 10,
                                      too_long: "Name must be under 10 characters long."
  validates_presence_of :name
end
