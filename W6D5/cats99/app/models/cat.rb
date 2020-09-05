require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    
    COLOR = ["black", "white", "pink"]

    validates :color, inclusion: COLOR, presence: true
    validates :sex, inclusion: ['M', 'F'], presence: true
    validates :birth_date, :name, :description, presence: true

    def age
        time_ago_in_words(birth_date)
    end
end