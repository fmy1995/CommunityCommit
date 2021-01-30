class Community < ApplicationRecord
    
belongs_to :admin
has_many :posts, dependent: :destroy

end
