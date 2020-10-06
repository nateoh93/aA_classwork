json.array! @parties do |party|
    json.name party.name
    json.location party.location
    json.guests do
        json.array! party.guests do |guest|
            json.name guest.name
        #    json.gifts guest.gifts
        end
    end
end