module Items
def Items.item

    items = [
      Item.new('+5 Dexterity Vest', 10, 20),
      Item.new('Aged Brie', 2, 0),
      Item.new('Elixir of the Mongoose', 5, 7),
      Item.new('Sulfuras, Hand of Ragnaros', 0, 80),
      Item.new('Sulfuras, Hand of Ragnaros', -1, 80),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 40),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 40),
      Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 40),
      Item.new('Conjured Mana Cake', 3, 6),
      Item.new('Aged Brie', 0, 0)
    ]
end

def Items.cycle(rose, many = 50)
    many.times { rose.update_quality }
  end
end