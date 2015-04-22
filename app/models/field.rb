class Field < ActiveRecord::Base
  belongs_to :bibref

  def to_bibtex
    unformatted_bibtex = "#{name} = {#{content}},"
    formatted_bibtex = format_special_characters(unformatted_bibtex)
  end

  def format_special_characters(unformatted_bibtex)
    unformatted_bibtex.gsub(/ä/, '\"{a}').gsub(/ö/, '\"{o}').gsub(/å/, '\r{a}')
  end
end
