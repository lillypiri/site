namespace :instagram do
  desc "Check Instagram for new posts"
  task fetch: :environment do
    instagram = Instagram.client(access_token: ENV['INSTAGRAM_TOKEN'])
    
    instagram.user_recent_media.each do |media|
      photo = Photo.where(instagram_id: media.id).first
      if photo.nil? && media.type == "image"
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
end
