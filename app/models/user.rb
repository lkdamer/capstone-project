class User < ActiveRecord::Base
  validates :name, :email, :password, presence: true
  validates :email, :name, uniqueness: true, on: :create, on: :update
  has_secure_password



  # def password
  #   @password ||= Password.new(password_hash)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

end
