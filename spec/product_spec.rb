require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.create(name: 'Trees') }
    let(:product) { Product.create(name: 'Oak', price: 100, quantity: 10, category: category) }

    it 'should save successfully' do
      expect(product).to be_valid
    end

    it 'should have a name' do
      product.name = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should have a price' do
      product.price_cents = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should have a quantity' do
      product.quantity = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should have a category' do
      product.category = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end 
end
