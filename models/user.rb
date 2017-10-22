require 'digest'

class User < ActiveRecord::Base
  def self.exists?(username)
    if User.find_by(username: username).nil?
      false
    else
      true
    end
  end

  def self.authorized?(username, password)
    user = User.find_by(username: username)

    return false if user.nil?

    salt = user.salt
    digest = Digest::SHA512.hexdigest(password + salt)

    (digest == user.password)
  end
end
