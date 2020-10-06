
json.extract! @guest, :name, :age, :favorite_color

json.gifts do
    json.array! @guest.gifts do |gift|
        json.title gift.title
        json.description gift.description
    end
end