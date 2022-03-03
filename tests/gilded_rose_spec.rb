# frozen_string_literal: true

require File.join("#{File.dirname(__FILE__)}/../app", 'gilded_rose')
require File.join("#{File.dirname(__FILE__)}/../app", 'item')


describe GildedRose do
  before(:each) do
    @items =  [
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
    @rose = GlidedRose.new(@items)
  end

  describe '#update_quality' do
    it 'does not change the name' do
     @rose
      expect(@items[0].name).to eq '+5 Dexterity Vest'
    end

    it 'Changes the quality of the aged brie ' do
     @rose
      expect(@items[1].quality).to eq 1
    end
    it 'Changes correctly the quality of aged brie when the sellin date has passed' do
     @rose
      expect(@items.last.quality).to eq 2
    end

    it 'Changes the quality of any item by 1 ' do
     @rose
      expect(@items[2].quality).to eq 6
    end

    it 'Sulfuras never change quality' do
     @rose
      expect(@items[3].quality).to eq 80
    end

    it 'Sulfuras never change sell in date' do
     @rose
      expect(@items[3].sell_in).to eq 0
    end

    it 'The quality is never negative' do
      cycle(@rose)
      expect(@items[0].quality).to be > -1
    end

    it 'Once the sell by date has passed, Quality degrades twice as fast' do
      cycle(@rose, 11)
      expect(@items[0].quality).to eq 8
    end

    it "Quality of an item shouldn't be greater than 50" do
     cycle(@rose, 60)
      expect(@items.last.quality).to be <= 50
    end

    it 'Backstage passes increase quality' do
     @rose
      expect(@items[5].quality).to eq 21
    end
    it 'Backstage passes increase quality twice as fast when sellin date is less than 10' do
     @rose

      expect(@items[6].quality).to eq 42
    end
    it 'Backstage passes increase quality thrice as fast when sellin date is less than 5' do
     @rose
      expect(@items[7].quality).to eq 43
    end

    it 'Backstage passes quality drops to 0 after sellin date' do
     @rose
      expect(@items[8].quality).to eq 0
    end

    it 'Conjured items degrade in quality twice as fast' do
     @rose
      expect(@items[9].quality).to eq 4
    end
    it 'Conjured items shouldnt have negative quality' do
      cycle(@rose)
      expect(@items[9].quality).to be > -1
    end
  end
end


def cycle (rose,many=50)
  many.times {rose }
end