class Book < ActiveRecord::Base

  validates :author, :title, :publisher, :year, presence: true
  validates :year, :inclusion => { :in => proc { 1000..0.years.ago.year } }

end