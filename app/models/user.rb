class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates(
    :email,
    format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address" },
    if: :email_present?
  )

  before_validation do
    if country != "Other"
      self.other_country = nil
    end
  end

  private

  def email_present?
    email.present?
  end
end
