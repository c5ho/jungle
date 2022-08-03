require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before(:each) do
    @new_category = Category.new
    @new_plant = Product.new({
      name: 'Super Plant', 
      description: "This is a super plant",
      image: "",
      quantity: 5,
      price: 24.99,
      category: @new_category
    })
    # bang operator ensures test fails for validation error
    @new_plant.save!
  end
  
  describe 'validations' do
    
    it 'should be successful with all fields filled out' do
      expect(@new_plant).to be_valid
      expect(Product.all.count).to eq(1)
    end

    it 'should not be successful with missing name field' do
      @new_plant.name = nil
      expect(@new_plant).not_to be_valid
      expect(@new_plant.errors.messages[:name]).to include('can\'t be blank')
    end

    it 'should not be successful with missing price field' do
      @new_plant.price_cents = nil
      expect(@new_plant).not_to be_valid
      expect(@new_plant.errors.messages[:price]).to include('can\'t be blank')
    end

    it 'should not be successful with missing quantity field' do
      @new_plant.quantity = nil
      expect(@new_plant).not_to be_valid
      expect(@new_plant.errors.messages[:quantity]).to include('can\'t be blank')      
    end

    it 'should not be successful with missing category field' do
      @new_plant.category = nil
      expect(@new_plant).not_to be_valid
      expect(@new_plant.errors.messages[:category]).to include('can\'t be blank')      
    end

  end
end
