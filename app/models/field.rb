class Field < ActiveRecord::Base
  belongs_to :bibref

  def to_bibtex
    bibtex = "#{name} = {#{content}},"
  end
end
