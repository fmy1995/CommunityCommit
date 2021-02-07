class Questionary < ApplicationRecord
    
belongs_to :community
has_many :questionary_item
has_many :questionary_result

validates :title, :description, :deadline, presence: {message:"は、必須項目です。"}
    
end
