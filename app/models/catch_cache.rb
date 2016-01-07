class CatchCache < ActiveRecord::Base
  belongs_to :fish
  belongs_to :catchable, polymorphic: true
end
