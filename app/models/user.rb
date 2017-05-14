class User < ApplicationRecord
  validates :name, :language, presence: true
  validates :other_language,
    presence: { if: -> (obj) { obj.language == "other" } }

  before_save do
    unless language == "other"
      self.other_language = ""
    end
  end
end
