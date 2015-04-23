class Field < ActiveRecord::Base
  belongs_to :bibref

  def to_bibtex
    unformatted_bibtex = "#{name} = {#{content}},"
    formatted_bibtex = format_special_characters(unformatted_bibtex)
  end

  def format_special_characters(unformatted_bibtex)
    unformatted_bibtex
        .gsub(/ä/, '\"{a}')
        .gsub(/Ä/, '\"{A}')
        .gsub(/ö/, '\"{o}')
        .gsub(/Ö/, '\"{O}')
        .gsub(/å/, '\r{a}')
        .gsub(/Å/, '\r{A}')
  end

  def get_parent
    Bibref.find(bibref_id)
  end
end
