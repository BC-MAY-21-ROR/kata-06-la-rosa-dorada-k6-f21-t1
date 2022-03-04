# frozen_string_literal: true

require File.join("#{File.dirname(__FILE__)}/../app", 'gilded_rose')
require File.join("#{File.dirname(__FILE__)}/../app", 'item')
require_relative 'asssets'
describe GildedRose do
  before(:each) do
    @items = Items.item
    @rose = GildedRose.new(@items)
  end


  describe '.update_quality' do
    it 'Once the sell by date has passed, Quality degrades twice as fast' do
      Items.cycle(@rose, 11)
      expect(@items[0].quality).to eq 8
    end
    it "Quality of an item shouldn't be greater than 50" do
      Items.cycle(@rose, 60)
      expect(@items.last.quality).to be <= 50
    end
    it 'Backstage passes increase quality twice as fast when sellin date is less than 10' do
      @rose.update_quality
      expect(@items[6].quality).to eq 42
    end
    it 'Backstage passes increase quality thrice as fast when sellin date is less than 5' do
      @rose.update_quality
      expect(@items[7].quality).to eq 43
    end
    it 'Backstage passes quality drops to 0 after sellin date' do
      @rose.update_quality
      expect(@items[8].quality).to eq 0
    end
    it 'Conjured items degrade in quality twice as fast' do
      @rose.update_quality
      expect(@items[9].quality).to eq 4
    end
  end
end
