class ExpirationDate
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes  
  
  field :asset_id
  field :date, :type => Date
  
  validates_uniqueness_of :asset_id, :scope => :date
  validates_presence_of :asset_id
  
  def self.search(search)
    if search.blank?
      all(sort: [[ :asset_id, :asc ]])
    else
      where(asset_id: search)
    end
  end

end
