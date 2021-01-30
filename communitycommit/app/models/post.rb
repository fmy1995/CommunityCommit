class Post < ApplicationRecord
    
belongs_to :admin
belongs_to :community

validates :in_front, inclusion: { in: [true, false] }
attachment :image

end
