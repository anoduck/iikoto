class Yarn < ActiveRecord::Base
  def op
    Post.where(number: number).first
  end

  def replies
    Post.where(yarn: number)[1..-1]
  end

  def images
    replies.reject do |post|
      post.file.nil?
    end
  end

  def completely_delete
    Post.where(yarn: number).delete_all
    delete
  end

  def reply_limit?
    replies.length >= $CONFIG[:reply_limit]
  end

  def image_limit?
    images.length >= $CONFIG[:image_limit]
  end
end
