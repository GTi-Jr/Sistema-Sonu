class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  #
  # has_one :sonu_event


  devise :database_authenticatable, :recoverable, :rememberable, :trackable

end
