class Photo < ActiveRecord::Base
  default_scope -> { order('posted_at desc') }
  
  
  def self.tagged (tag)
    where("tags ~ '##{tag}'")
  end
end
