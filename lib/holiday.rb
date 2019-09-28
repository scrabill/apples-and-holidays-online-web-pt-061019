require 'pry'

holiday_hash = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |holiday,array| # The code is now more reusable for future use cases!
    array << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten # One line!
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season,holiday|
    puts "#{season.capitalize}:" # Changes "winter" to "Winter" before printing it
      holiday_hash[season].each do |holiday,supplies|
        # Turn the holiday symbol into a string, globally replace all underscores with a space then split each word, capitalize the first letter, then put it back in the string. Wow!
        # THEN turn the array of supplies into a string, with each item array separated by a comma and space
        puts "  " + holiday.to_s.gsub("_"," ").split.map(&:capitalize).join(' ') + ": " + supplies.join(', ')
      end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  array = []

  holiday_hash.each do |season, holiday|
    holiday_hash[season].each do |holiday,supplies|
      if supplies.any?("BBQ")
        array << holiday
      end
    end
  end

  array

end
