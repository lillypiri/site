require 'open-uri'


namespace :instagram do
  desc "Check Instagram for new posts"
  task fetch: :environment do
    instagram = Instagram.client(access_token: ENV['INSTAGRAM_TOKEN'])
    
    instagram.user_recent_media.each do |media|
      photo = Photo.where(image_url: media.images.standard_resolution.url).first
      if photo
        photo.update({
          instagram_id: media.id,
          image_url: media.images.standard_resolution.url,
          caption: media.caption&.text,
          tags: media.tags.map{ |t| "##{t}"}.join(' '),
          posted_at: Time.at(media.created_time.to_i),
          external_url: media.link
        })
        
      elsif photo.nil? && media.type == "image"
        Photo.create({
          instagram_id: media.id,
          image_url: media.images.standard_resolution.url,
          caption: media.caption&.text,
          tags: media.tags.map{ |t| "##{t}"}.join(' '),
          posted_at: Time.at(media.created_time.to_i),
          external_url: media.link
        })
      end
    end
  end
  
  
  desc "Update"
  task update: :environment do
    photos = Photo.unscoped.where('instagram_id is null').order('created_at desc').limit(5)
    
    photos.each do |photo|
      begin
        content = open(photo.external_url).read
        
        instagram_id = /"id": "([0-9]+)?", "caption"/.match(content)&.captures&.first
        
        posted_at = /"created_at": ([0-9\.]+)?,/.match(content)&.captures&.first
        if posted_at.nil?
          posted_at = /"date": ([0-9\.]+)?,/.match(content)&.captures&.first
        end
        
        photo.update({
          instagram_id: instagram_id,
          posted_at: Time.at(posted_at.to_i)
        })
      rescue
        # Do nothing
      end
    end
  end
end
