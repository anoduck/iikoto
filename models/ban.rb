class Ban < ActiveRecord::Base
  def self.banned?(ip)
    !Ban.where(ip: ip).empty?
  end

  # Deletes all posts and yarns by a given IP
  def self.delete_by(ip)
    Post.where(ip: ip).map do |post|
      yarn = Yarn.find_by(number: post.number)

      yarn.completely_delete unless yarn.nil?

      post.delete
    end
  end
end
