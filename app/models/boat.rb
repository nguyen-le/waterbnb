class Boat < ActiveRecord::Base
  validates :name, :location, :price, :size, :owner_id, presence: true
  belongs_to(
    :owner,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: 'User'
  )
end