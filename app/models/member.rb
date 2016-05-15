class Member < ApplicationRecord
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable, :account_expireable
  # :registerable, :confirmable, :lockable, :timeoutable, :omniauthable

  # Validations
  validates_presence_of :first_name, :last_name

  # Scopes
  scope :active, -> { where(expires_at: nil).or(where('expires_at > ?', Date.today)) }
  scope :inactive, -> { where('expires_at < ?', DateTime.now) }
  scope :committee, lambda {
    tagged_with [
      'Director', 'Assistant Director', 'Secretary', 'Treasurer',
      'Activities Officer', 'Charity Officer', 'Membership Officer', 'Webmaster'
    ], on: :positions, any: true
  }
  scope :marshals, lambda {
    tagged_with [
      'Head Road Captain', 'Road Captain', 'Pack Leader', 'Sweeper',
      'Biker Buddy', 'Safety Officer', 'Marshal'
    ], on: :positions, any: true
  }

  acts_as_taggable_on :positions

  # Instance methods
  def full_name
    "#{first_name} #{last_name}"
  end

  def committee?
    self.class.committee.include?(self)
  end

  def marshal?
    self.class.marshals.include?(self)
  end

  def holds_position?(title)
    position_list.include? title
  end
end
