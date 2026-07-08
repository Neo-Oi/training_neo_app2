class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  has_secure_password
  before_validation :normalize_email
  validates :name, presence: true, length: { maximum: 50 }
  validates :email,presence: true,length: { maximum: 255 },format: { with: URI::MailTo::EMAIL_REGEXP },uniqueness: { case_sensitive: false }
  validates :role,presence: true,inclusion: { in: %w[admin member] }
  validates :password,presence: true,length: { minimum: 8, maximum: 72 },allow_nil: true
  
  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end
