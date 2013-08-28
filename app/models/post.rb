class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags

  validates_length_of :title, maximum: 20,
                                      too_long: "Title must be under 20 characters long."
  validates_presence_of :title, :body
end
