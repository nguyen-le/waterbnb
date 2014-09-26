class Boat < ActiveRecord::Base
  validates :name, :location, :price, :size, :owner, :images, presence: true
  belongs_to(
    :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'
  )
  has_many :images
end
