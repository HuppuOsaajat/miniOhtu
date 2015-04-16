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
      },
      inproceedings: {
          required: [:author, :title, :booktitle, :publisher, :year],
          optional: [:editor, :volume, :series, :pages, :address, :month, :organization, :publisher, :note, :key]
      },
      misc: {
          required: [],
          optional: [:author, :title, :howpublished, :month, :year, :note, :key]
      },
      mastersthesis: {
          required: [:author, :title, :school, :year],
          optional: [:type, :address, :month, :note, :key]
      },
      phdthesis: {
          required: [:author, :title, :school, :year],
          optional: [:type, :address, :month, :note, :key]
      },
      unpublished: {
          required: [:author, :title, :note],
          optional: [:month, :year, :key]
      },
      proceedings: {
          required: [:title, :year],
          optional: [:editor, :volume, :series, :address, :month, :publisher, :organization, :key]
      },
      techreport: {
          required: [:author, :title, :institution, :year],
          optional: [:type, :number, :address, :month, :note, :key]
      },
      booklet: {
          required: [:title],
          optional: [:author, :howpublished, :address, :month, :year, :note, :key]
      }
  }

  def get_required_fields
    @@reference_types["#{reftype}".to_sym][:required]
  end

  def get_optional_fields
    @@reference_types["#{reftype}".to_sym][:optional]
  end
end
