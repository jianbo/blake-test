# encoding: utf-8
#
class Sequence < ApplicationRecord
  belongs_to :sequenceable, polymorphic: true
end
