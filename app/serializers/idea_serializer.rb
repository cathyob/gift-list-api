# frozen_string_literal: true
class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :title, :where, :price, :notes, :status
  has_one :giftee
end
