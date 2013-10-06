class Onion < ActiveRecord::Base
    has_many :statuses

    def self.schedule
        Onion.all.each do |o|
            # TODO perform some test of each onion
            o.statuses.new(:status => 200)
            o.save!
        end
    end
end
