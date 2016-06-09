class HomeController < ApplicationController
  def index
    @photos = Photo
    @items = ShopItem.sample(9)
  end
end
