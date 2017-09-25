class Tweet < ApplicationRecord
  belongs_to :user
    
    validates :user, presence: true
    
    validates :conteudo, presence: true, length: { maximum: 140 }
    
    
    
end
