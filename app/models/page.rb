class Page < ApplicationRecord

  validates_presence_of :url
  validate :valid_url?

  before_create :set_content

  private

  def set_content
    self.content ||= Scraper.new(self.url).call
  end

  def valid_url?
    success = begin
      response = HTTParty.get(self.url)
      (response.code == 200 || response.code == 302)
    rescue
      false
    end
    errors.add(:url, 'is not valid') unless success
  end
end
