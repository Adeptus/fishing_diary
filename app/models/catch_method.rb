class CatchMethod < ActiveRecord::Base
  include ClassyEnum::ActiveRecord

  classy_enum_attr :fishing_type
end
