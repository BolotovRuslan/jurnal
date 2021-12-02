class Page < ApplicationRecord
  TITLEPAGE_FORMAT = /\A[а-яА-ЯёЁa-zA-Z0-9_]+\z/

  validates :title, presence: true, format: { with: TITLEPAGE_FORMAT }
  validates :header, presence: true
  validates :body, presence: true

  has_ancestry

end
