class HomeController < ApplicationController
  def index
    @photos = Photo
    @items = ShopItem.all.sample(9)
  end
end
