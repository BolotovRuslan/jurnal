class Page < ApplicationRecord
  before_save :refactor_body
  before_update :refactor_body

  TITLEPAGE_FORMAT = /\A[а-яА-ЯёЁa-zA-Z0-9_]+\z/

  validates :title, presence: true, format: { with: TITLEPAGE_FORMAT }
  validates :header, presence: true
  validates :body, presence: true

  has_ancestry

  def refactor_body
    self.body = body.gsub(/\*\*(?<text>.*)\*\*/, '<b>\k<text></b>')
    self.body = body.gsub(/\\\\(?<text>.*)\\\\/, '<i>\k<text></i>')
    self.body = body.gsub(/\(\((?<site>.*) (?<text>.*)\)\)/, '<a href="/\k<site>">\k<text></a>')

    self.body.html_safe
  end
end
