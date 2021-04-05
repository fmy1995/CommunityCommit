class Community < ApplicationRecord
    
belongs_to :admin
has_many :posts, dependent: :destroy
has_many :belongs, dependent: :destroy
has_many :questionaries, dependent: :destroy
   
  validates :name, presence: true
   
  def belonged_by?(user)
    belongs.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Community.where(name: content)
    else
      Community.where('name LIKE ?', '%'+content+'%')
    end
  end

end
