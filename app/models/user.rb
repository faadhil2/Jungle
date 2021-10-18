class User < ActiveRecord::Base
  has_secure_password
  
  validates :password,              length: { minimum: 4 }
  validates :password_confirmation, presence: true
  validates :first_name,            presence: true
  validates :last_name,             presence: true
  validates :email,                 presence: true, uniqueness: { case_sensitive: false }

def self.authenticate_with_credentials(email, password)
  if (email)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  else
    nil
  end

end


end
