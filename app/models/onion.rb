class Onion < ActiveRecord::Base
    has_many :statuses

    def self.up
        Onion.all.map{|s| s = s.statuses.first.status == 200 ? 1 : 0}.inject(:+)
    end
    def self.down
        Onion.all.count - self.up
    end
    def self.last_update
        Status.order("updated_at desc").limit(1).first.updated_at
    end
end
