class HomeController < ApplicationController
  def index
    @photos = Photo
    @items = ShopItem
  end
end
