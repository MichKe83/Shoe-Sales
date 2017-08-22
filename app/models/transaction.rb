class Transaction < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :shoe, required: true

  has_many :users
  has_many :shoes, dependent: :destroy 

end
