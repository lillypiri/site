class Photo < ActiveRecord::Base
  default_scope -> { where('posted_at is not null').order('posted_at desc') }
  
  
  def self.tagged (tag)
    where("tags ~ '##{tag}'")
  end
end
