class Destination < ActiveRecord::Base
    belongs_to :user
    validates :name, presence:true
    validates :location, presence:true
    validates :things_to_do, presence:true
end