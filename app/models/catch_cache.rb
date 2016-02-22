class CatchCache < ActiveRecord::Base
  belongs_to :fish
  belongs_to :catchable, polymorphic: true
  belongs_to :method, class_name: 'CatchMethod'

  scope :all_methods, -> { where(method_id: nil) }
end
