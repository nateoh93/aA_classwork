class Album < ApplicationRecord
    validates :title, :year, presence: true # Do we need live?

    belongs_to :band,
    class_name: :Band
    
end
