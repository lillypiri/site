namespace :etsy do
  desc "Check Etsy for new items"
  task fetch: :environment do
    shop = Etsy.user('lillypiri').shop

    shop.listings.each do |listing|
      item = ShopItem.where(etsy_id: listing.id).first
      if item.nil?
        ShopItem.create({
          title: listing.title,
          external_url: listing.url,
          price: listing.price,
          etsy_id: listing.id,
          image_url: listing.images.first.square
        })
      end
    end
  end
end
