# frozen_string_literal: true
class NoteSerializer < ActiveModel::Serializer
  attributes :id, :favorites, :sizes, :general
  has_one :giftee
end
