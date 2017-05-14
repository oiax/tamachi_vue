class User < ApplicationRecord
  validates :name, :language, presence: true
  validates :other_language,
    presence: { if: -> (obj) { obj.language == "other" } }
end
