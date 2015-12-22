class Event < ActiveRecord::Base
  belongs_to :user

  #order events desc
  default_scope { order(event_date: :desc) }
  
  #geocode stuff
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  #paperclip
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  #import events spreadsheet
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    CSV.foreach(file.path, headers: true) do |row|
      Event.create! row.to_hash
    end    
  end
    
  #validates spreadsheet type
  def self.open_spreadsheet(file)    
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else 
      raise "Unknown file type: #{file.original_filename}"
    end
  end
  
end
