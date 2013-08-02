class Publication < ActiveRecord::Base
  validates_presence_of :title, :summary
end
