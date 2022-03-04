# frozen_string_literal: true

require File.join("#{File.dirname(__FILE__)}/../app", 'gilded_rose')
require File.join("#{File.dirname(__FILE__)}/../app", 'item')
require_relative 'asssets'
describe GildedRose do
  before(:each) do
    @items = Items.item
    @rose = GildedRose.new(@items)
  end

  describe '#update_quality' do
    it 'Changes the quality of the aged brie ' do
      @rose.update_quality
      expect(@items[1].quality).to eq 1
    end
    it 'Changes correctly the quality of aged brie when the sellin date has passed' do
      @rose.update_quality
      expect(@items.last.quality).to eq 2
    end
    it 'Changes the quality of any item by 1 ' do
      @rose.update_quality
      expect(@items[2].quality).to eq 6
    end
    it 'Sulfuras never change ' do
      @rose.update_quality
      expect(@items[3].sell_in).to eq 0
      expect(@items[3].quality).to eq 80
    end
    it 'The quality is never negative' do
      Items.cycle(@rose)
      expect(@items[0].quality).to be > -1
    end
  end

  
end
