# frozen_string_literal: true
class Idea < ApplicationRecord
  belongs_to :giftee

  validates :title, presence: true
end
