class Status < ActiveRecord::Base
    validates :onion_id, presence: true
    belongs_to :onion
end
