class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

   validates_length_of :name, maximum: 20,
                                      too_long: "Name must be under 20 characters long."
  validates_presence_of :name
end
