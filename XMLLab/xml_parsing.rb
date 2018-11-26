require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu, :calories_array

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
    @menu_prices = @menu.search('price')
    @menu_calories = @menu.search('calories')
    @menu_foods = @menu.search('food')
    @calories_array = []
  end

  def prices
    prices = @menu_prices.text.split '£'
    prices.drop(1)
  end

  def calories
    calories = @menu_calories
    counter = 0
    calories.pop
    limiter = calories.length
    calories.each do |i|
      counter =+ 1
      if counter <= limiter
        @calories_array << i.text
      end
    end
  end

  # def foods
  #     waffles_meals = []
  #     if @menu_foods
  # end

  # Place your methods here

end
