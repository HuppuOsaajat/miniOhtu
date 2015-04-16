class Reference < ActiveRecord::Base

  has_many :attributes, dependent: :destroy
end

# TODO BibTeX generation method

