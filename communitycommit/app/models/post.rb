class Post < ApplicationRecord
    
belongs_to :admin
belongs_to :community
has_many :post_comments, dependent: :destroy

validates :title, presence: true
validates :in_front, inclusion: { in: [true, false] }
attachment :image

end
