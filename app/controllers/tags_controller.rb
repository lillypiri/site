class TagsController < ApplicationController
  def show
    @photos = Photo.tagged(params[:id])
    @title = params[:id]
  end
end
