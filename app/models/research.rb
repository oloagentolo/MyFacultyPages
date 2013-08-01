class Research < ActiveRecord::Base
  validates_presence_of :topic, :summary
end
