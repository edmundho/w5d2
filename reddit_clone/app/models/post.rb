class Post < ApplicationRecord
  
  
  validates :title, presence: true, uniqueness: true
  
  has_many :postsubs,
   class_name: :PostSub
   
  has_many :subs,
    through: :postsubs
  
  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
  
end
