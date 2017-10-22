class Banner
  def self.pick
    return nil unless File.directory? 'public/banners/'

    banners = Dir.entries('public/banners/').reject do |f|
      File.directory? f
    end

    if banners.empty?
      nil
    else
      banners.sample.prepend('/banners/')
    end
  end
end
