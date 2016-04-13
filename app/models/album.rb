class Album < ActiveRecord::Base
  belongs_to :format
  has_many   :listening_sessions
end

