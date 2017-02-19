# frozen_string_literal: true
class GifteeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user
end
