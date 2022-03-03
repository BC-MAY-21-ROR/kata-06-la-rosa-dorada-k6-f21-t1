# frozen_string_literal: true

# Logic for the item degrading
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
      when 'Aged Brie' then  aged_brie(item)
      when 'Backstage passes to a TAFKAL80ETC concert' then backstage(item)
      when 'Sulfuras, Hand of Ragnaros' then sulfuras(item)
      when 'Conjured Mana Cake' then  conjured(item)
      else                            any_item(item)
      end
    
    end
  end

  def any_item(item)
    item.quality -= item.sell_in <= 0 ? 2 : 1

    item.quality = 0 if item.quality.negative?
    item.sell_in -= 1 
  end

  def conjured(item)
    item.quality -= 2
    item.quality = 0 if item.quality.negative?
    item.sell_in -= 1 
  end

  def aged_brie(item)
    item.quality += item.sell_in <= 0 ? 2 : 1
    item.quality = 50 if item.quality > 50
    item.sell_in -= 1 
  end

  def sulfuras(item)
    item.quality = 80
  end

  def backstage(item)
    case item.sell_in
    when 6..10
      item.quality += 2
    when 1..5
      item.quality += 3
    when item.sell_in..0
      item.quality = 0
    else
      item.quality += 1
    end
    item.sell_in -= 1 
  end
end
