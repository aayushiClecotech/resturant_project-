class User < ApplicationRecord
 rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
  has_many :reviews , dependent: :destroy
  
  has_one_attached :image
  has_many :restaurants, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable 

def normal_user?
  has_role?(:normal_user)
end

def restaurant_owner?
  has_role?(:restaurant_owner)
  
end 


private
def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
