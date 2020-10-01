class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :addresses

  validates :first_name, presence: true
  validates :first_name_kana, presence: true
  validates :family_name, presence: true
  validates :family_name_kana, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :telephone, presence: true


    def active_for_authentication?
     super && (self.is_deleted == false)
    end

   def first_family_name
   	self.first_name + self.last_name
   end

end
