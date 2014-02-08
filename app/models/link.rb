class Link < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
end
