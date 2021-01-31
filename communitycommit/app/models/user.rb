class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  validates :postal, format: { with: /\A\d{7}\z/ }
  validates :adress, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/}
  
  has_many :post_comments, dependent: :destroy
  
end
