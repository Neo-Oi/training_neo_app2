class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  has_secure_password
  before_validation :normalize_email
  validates :password, presence: true, length: { minimum: 8, maximum: 72 }, allow_nil: true

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end
