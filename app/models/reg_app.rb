class RegApp < ActiveRecord::Base

  belongs_to :user
  has_many :events

  validates :url, presence: true, uniqueness: { scope: :user_id }
end
