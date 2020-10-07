class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cart_items


  validates :first_name, presence: true
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :family_name, presence: true
  validates :family_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :post_code, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
  validates :telephone, presence: true, numericality: { only_integer: true }




  def active_for_authentication?
   super && (self.is_deleted == false)
  end

end
