class TemplatedEmail < ApplicationRecord
  belongs_to :message_template

  validates :sender_name, presence: true
  validates :destination_email, presence: true
end
