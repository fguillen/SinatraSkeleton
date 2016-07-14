module SinatraSkeleton
  class Visit < ActiveRecord::Base
    validates :datestamp, :presence => true
  end
end