class Onion < ActiveRecord::Base
    has_many :statuses

    def self.schedule
    end
end
