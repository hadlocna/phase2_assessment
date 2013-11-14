include BCrypt
class User < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/}
  validates :password_digest, presence: true
  has_many :created_events, class_name: "Event", foreign_key: "user_id"
  has_many :attended_events, class_name: "EventAttendance", foreign_key: "user_id"
end

def password
@password ||= Password.new(password_digest)
end
def password=(new_password)
@password = Password.create(new_password) self.password_digest = @password
end
def self.authenticate(email, password)
user = User.find_by_email(email)
return user if user && (user.password == password) nil
end