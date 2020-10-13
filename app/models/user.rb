class User < ApplicationRecord
  USER_PARAMS = %i(name email password password_confirmation).freeze
  before_save :downcase_email

  validates :name, presence: true,
    length: {maximum: Settings.user_name.max_length}
  validates :email, presence: true,
    length: {maximum: Settings.email.max_length},
    format: {with: URI::MailTo::EMAIL_REGEXP},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.password.min_length}

  has_secure_password

  private

  def downcase_email
    email.downcase!
  end
end
