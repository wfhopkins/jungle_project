require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    #validates :name, presence: true
    it "should have a name" do
      @category = Category.create(name: 'Trees')
      @product = Product.new(
        name: 'Bonsai',
        price_cents: 100000,
        quantity: 12,
        category: @category
      )
      expect(@product.name.present?).to be true
    end

    #validates :price, presence: true
    it "should have a price" do
      @category = Category.create(name: 'Trees')
      @product = Product.new(
        name: 'Willow',
        price_cents: 10000,
        quantity: 9,
        category: @category
      )
      expect(@product.price.present?).to be true
    end

    #validates :quantity, presence: true
    it "should have a quantity" do
      @category = Category.create(name: 'Cacti')
      @product = Product.new(
        name: 'Saguaro',
        price_cents: 15000,
        quantity: 23,
        category: @category
      )
      expect(@product.quantity.present?).to be true
    end

    #validates :category, presence: true
    it "should have a category" do
      @category = Category.create(name: 'Succulents')
      @product = Product.new(
        name: 'Aloe Vera',
        price_cents: 2500,
        quantity: 30,
        category: @category
      )
      expect(@product.category.present?).to be true
    end

    #validates :name, value: nil
    it "should return an error with message when name has a nil value" do
      # test code
      @category = Category.create(name: 'Succulents')
      @product = Product.new(
        name: nil,
        price_cents: 2500,
        quantity: 30,
        category: @category
      )
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
  end
end
