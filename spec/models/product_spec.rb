require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    
    it 'should be successful with all fields filled out' do
      new_category = Category.new
      new_plant = Product.new({
        name: 'Super Plant', 
        description: "This is a super plant",
        image: "",
        quantity: 5,
        price: 24.99,
        category: new_category
      })
      expect(new_plant).to be_valid
    end

    it 'should not be successful with missing name field' do
      new_category = Category.new
      new_plant = Product.new({
        name: nil, 
        description: "This is a super plant",
        image: "",
        quantity: 5,
        price: 24.99,
        category: new_category
      })
      expect(new_plant).not_to be_valid
    end

    it 'should not be successful with missing price field' do
      new_category = Category.new
      new_plant = Product.new({
        name: 'Super Plant', 
        description: "This is a super plant",
        image: "",
        quantity: 5,
        price: "", # why doesn't this work with nil?
        category: new_category
      })
      p new_plant
      expect(new_plant).not_to be_valid
    end

    it 'should not be successful with missing quantity field' do
      new_category = Category.new
      new_plant = Product.new({
        name: 'Super Plant', 
        description: "This is a super plant",
        image: "",
        quantity: nil,
        price: 24.99,
        category: new_category
      })
      expect(new_plant).not_to be_valid
    end

    it 'should not be successful with missing category field' do
      new_category = Category.new
      new_plant = Product.new({
        name: 'Super Plant', 
        description: "This is a super plant",
        image: "",
        quantity: 5,
        price: 24.99,
        category: nil
      })
      expect(new_plant).not_to be_valid
    end


  end
end
