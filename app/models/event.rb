class Event < ActiveRecord::Base
  belongs_to :user
  
  #paperclip
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  #paperclip
  
  #order events desc
  default_scope { order(event_date: :desc) }
end
