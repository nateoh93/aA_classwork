class Band < ApplicationRecord
    validates :name, presence: true

    has_many :albums,
    class_name: :Album,
    dependent: :destroy
    
end
