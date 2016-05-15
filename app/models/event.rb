class Event < ApplicationRecord
  belongs_to :writeup_author, class_name: 'Member'

  has_attached_file :poster
  validates_attachment_content_type :poster, content_type: %r{\Aimage\/.*\Z}
  validates_presence_of :title, :occurs_on

  scope :upcoming, -> { where('occurs_on > ?', DateTime.now) }
  scope :recent,   -> { where('occurs_on < ?', DateTime.now) }
  scope :listed,   -> { where(committee_only: false, marshal_only: false) }

  acts_as_taggable

  def timeframe
    if starts_at && ends_at
      "#{starts_at} - #{ends_at}"
    else
      (starts_at || occurs_on).to_s
    end
  end
end
