# frozen_string_literal: true
class Giftee < ApplicationRecord
  belongs_to :user
  has_one :note
  has_many :ideas

  validates :name, presence: true
end
