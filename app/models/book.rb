class Book < ActiveRecord::Base
  validates :author, presence: true
  validates :title, presence: true
  validates :publisher, presence: true
  validates :year, presence: true
end
