class Book < ActiveRecord::Base

  validates :name, presence: true
  validates :author, presence: true
   
  def self.search(search, designation)
    search_condition = "%" + search + "%"
    where("#{designation} LIKE ?", "%#{search}%")
  end

end
