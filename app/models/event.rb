class Event < ActiveRecord::Base
  belongs_to :user

  #order events desc
  default_scope { order(event_date: :asc) }
  
  #geocode stuff
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  #paperclip
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  #import events spreadsheet
  def self.import(file)
  
  headers = [
      "name",
      "image",
      "address",
      "event_date"     
    ]
 
    ActiveRecord::Base.establish_connection
 
    CSV.foreach(file.path, headers: true) do |row|
      sql_keys = []
      sql_vals = []
 
      created_at = Time.now.strftime("%Y-%m-%d %H:%M:%S")
 
      headers.each_with_index do |key, idx|
        val = row[idx]
 
        sql_keys << key
        sql_vals << ActiveRecord::Base.connection.quote(val)
      end
 
      sql = "
        INSERT INTO events (#{sql_keys.join(', ')}, created_at, updated_at) 
        VALUES (#{sql_vals.join(', ')}, '#{created_at}', '#{created_at}')
      "
 
      res = ActiveRecord::Base.connection.execute(sql)
      #bar_id = ActiveRecord::Base.connection.last_inserted_id(res)   
    end
  end
  
end
