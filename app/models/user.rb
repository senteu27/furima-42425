class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


has_many  :items
has_many  :buys

validates :nickname, presence: true
validates :password, format:{with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/,message:"は数字と英語を含むようにしてください。"}
validates :first_name, presence: true
validates :last_name, presence: true
validates :first_name_kana, presence: true
validates :last_name_kana, presence: true
validates :birthday, presence: true
end