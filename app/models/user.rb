class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add the username attribute
  validates :username, presence: true, uniqueness: true, length: { maximum: 20, too_long: '20 characters is the maximum allowed' }
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'must be a valid email address' }, uniqueness: true
  validates :password, format: {
    with: /\A(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}\z/m,
    message: "must have at least one uppercase letter, one lowercase letter, one numeric character, and one special character."
  }
end
