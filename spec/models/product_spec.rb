require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    # validation tests/examples here

    it 'should contain a name' do
    @category = Category.new(name: "Test1")
    @product = Product.new(name: "Computer", price_cents: 3000, quantity: 3, :category => @category)
    expect(@product.name).to be_present
  end

  it 'should contain a price' do
    @category = Category.new(name: "Test2")
    @product = Product.new(name: "Computer", price_cents: 3000, quantity: 3, :category => @category)
    expect(@product.price_cents).to be_present
  end

  it 'should contain a quantity' do
    @category = Category.new(name: "Test3")
    @product = Product.new(name: "Computer", price_cents: 3000, quantity: 3, :category => @category)
    expect(@product.quantity).to be_present
  end

  it 'should contain a category' do
    @category = Category.new(name: "Test4")
    @product = Product.new(name: "Computer", price_cents: 3000, quantity: 3, :category => @category)
    expect(@product.category).to be_present
  end

  it 'should contain a nil value for name' do
    @category = Category.new(name: "Test1")
    @product = Product.new(price_cents: 3000, quantity: 3, :category => @category)
    expect(@product.name).to be_nil
  end



  end
end

