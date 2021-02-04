class Community < ApplicationRecord
    
belongs_to :admin
has_many :posts, dependent: :destroy
  has_many :belongs, dependent: :destroy

  def belonged_by?(user)
    belongs.where(user_id: user.id).exists?
  end

belongs_to :user

  def self.search_for(content, method)
    if method == 'perfect'
      Community.where(name: content)
    else
      Community.where('name LIKE ?', '%'+content+'%')
    end
  end

end
