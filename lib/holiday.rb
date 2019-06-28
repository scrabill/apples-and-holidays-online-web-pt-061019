require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  #holiday_hash[:winter][:christmas] = "Balloons"

  # holiday_hash.each do |season_key|
  #   while season_key == :winter
  #
  #   end
  # end

  # holiday_hash[:winter][:christmas] << supply # This works too, but lets refactor it!
  # holiday_hash[:winter][:new_years] << supply

  holiday_hash[:winter].each do |holiday,array| # The code is now more reusable for future use cases!
    array << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array

  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash[season][holiday_name] = supply_array

  holiday_hash

end

add_new_holiday_with_supplies(holiday_hash, :winter, :kwanza, ["candles"])

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  new_array = []


  holiday_hash[:winter].each do |holiday_key, supply_array|
    new_array << supply_array
  end

  new_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each do |season,holiday|
    x = season.capitalize # Changes "winter" to "Winter" before printing it
    puts "#{x}:"

    holiday_hash[season].each do |holiday,supplies|
      y = holiday.to_s.gsub("_"," ").split.map(&:capitalize).join(' ') # Turn the holiday symbol into a string, globally replace all underscores with a space then split each word, capitalize the first letter, then put it back in the string. Wow!
      z = supplies.join(', ') # Turns the array of supplies into a string, with each item array separated by a comma and space
      puts "  #{y}: #{z}"
    end

  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  new_array = []

  holiday_hash.each do |season,holiday|
    holiday_hash[season].each do |holiday,supplies|
      if supplies.any?("BBQ") == true
      new_array << holiday
      end
    end
  end
  new_array

end
