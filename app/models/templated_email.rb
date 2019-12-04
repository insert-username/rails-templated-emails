class TemplatedEmail < ApplicationRecord
  belongs_to :message_template

  validates :sender_name, presence: true
  validates :destination_email, presence: true
  validates_email_format_of :destination_email, :message => 'Not a valid email.'
end
