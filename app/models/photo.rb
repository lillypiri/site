class Photo < ActiveRecord::Base
  def self.tagged (tag)
    where("tags ~ '##{tag}'")
  end
end
