class Sub < ApplicationRecord
  
  validates :title, :description, :moderator_id, presence: true
  validates :title, uniqueness: true
  
  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: "User"
    
  has_many :postsubs,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :PostSub
  
  has_many :posts,
  through: :postsubs
end
