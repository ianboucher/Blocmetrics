class RegApp < ActiveRecord::Base
  belongs_to :user

  validates :url, presence: true, uniqueness: true
end
