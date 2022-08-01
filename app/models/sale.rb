class Sale < ApplicationRecord
  
  # can also define this way
  # scope :active, -> { where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current) }

  # with self it is a class method, AR scope
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end
  
  # don't need self.ends_on because its reading attributes from itself
  # ? methods return Boolean
  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current 
  end

  def active?
    !upcoming? && !finished?
  end
  
end
