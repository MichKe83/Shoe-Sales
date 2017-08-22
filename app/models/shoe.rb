class Shoe < ActiveRecord::Base
  belongs_to :user, required: true

  has_many :transactions, dependent: :destroy

  validates :name, :amount, presence: true
end
