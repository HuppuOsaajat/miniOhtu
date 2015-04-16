class Bibref < ActiveRecord::Base

  has_many :fields

  @@reference_types = {
      article: {
          required: [:author, :title, :journal, :year, :volume],
          optional: [:number, :pages, :month, :note, :key]
      },
      book: {
          required: [:author, :title, :publisher, :year],
          optional: [:volume, :series, :address, :edition, :month, :note, :key]
      }
  }

  def get_required_fields
    @@reference_types["#{reftype}".to_sym][:required]
  end

  def get_optional_fields
    @@reference_types["#{reftype}".to_sym][:optional]
  end
end
