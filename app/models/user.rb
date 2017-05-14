class User < ApplicationRecord
  validates :name, :language, presence: true
  validates :language, inclusion: { in: %w(ruby php other) }
  validates :other_language,
    presence: { if: -> (obj) { obj.language == "other" } }

  before_save do
    unless language == "other"
      self.other_language = ""
    end
  end

  def language_for_display
    case language
    when "ruby"
      "Ruby"
    when "php"
      "PHP"
    when "other"
      other_language
    else
      raise
    end
  end
end
