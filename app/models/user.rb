class User < ActiveRecord::Base
	has_secure_password

	has_many :shoes, dependent: :destroy

	before_save :downcase_fields

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :first_name, :last_name, presence: true, length: 2..30

	validates :email, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
	validates :password, presence: true


	def downcase_fields
	    self.first_name.downcase!
	    self.last_name.downcase!
	    self.email.downcase!
	end 

	def self.full_name
      return "#{self.first_name.titleize} #{self.last_name.titleize}"
  	end

end

