class User < ApplicationRecord
	has_secure_password

	# Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
	validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :password, length: { minimum: 5 }  

  def self.authenticate_with_credentials(email, password)
    user = where('LOWER(email) = ?', email.downcase.delete(' '))[0]
    user && user.authenticate(password)
  end

end