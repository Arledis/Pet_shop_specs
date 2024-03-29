require('minitest/autorun')
require('minitest/rg')
require_relative('../pet_shop')

class TestPetShop < Minitest::Test

  def setup

    @customers = [
      {
        name: "Alice",
        pets: [],
        cash: 1000
      },
      {
        name: "Bob",
        pets: [],
        cash: 50
      }
    ]

    @new_pet = {
      name: "Bors the Younger",
      pet_type: :cat,
      breed: "Cornish Rex",
      price: 100
    }

    @pet_shop = {
      pets: [
        {
          name: "Sir Percy",
          pet_type: :cat,
          breed: "British Shorthair",
          price: 500
        },
        {
          name: "King Bagdemagus",
          pet_type: :cat,
          breed: "British Shorthair",
          price: 500
        },
        {
          name: "Sir Lancelot",
          pet_type: :dog,
          breed: "Pomsky",
          price: 1000,
        },
        {
          name: "Arthur",
          pet_type: :dog,
          breed: "Husky",
          price: 900,
        },
        {
          name: "Tristan",
          pet_type: :dog,
          breed: "Basset Hound",
          price: 800,
        },
        {
          name: "Merlin",
          pet_type: :cat,
          breed: "Egyptian Mau",
          price: 1500,
        }
      ],
      admin: {
        total_cash: 1000,
        pets_sold: 0,
      },
      name: "Camelot of Pets"
    }
  end


  def test_pet_shop_name
    name = pet_shop_name(@pet_shop)
    assert_equal("Camelot of Pets", name)
  end

  def test_total_cash
    sum = total_cash(@pet_shop)
    assert_equal(1000, sum)
  end

  def test_add_or_remove_cash__add
    add_or_remove_cash(@pet_shop,10)
    cash = total_cash(@pet_shop)
    assert_equal(1010, cash)
  end
  #
  def test_add_or_remove_cash__remove
    add_or_remove_cash(@pet_shop,-10)
    cash = total_cash(@pet_shop)
    assert_equal(990, cash)
  end

  def test_pets_sold
    sold = pets_sold(@pet_shop)
    assert_equal(0, sold)
  end

  def test_increase_pets_sold
    increase_pets_sold(@pet_shop,2)
    sold = pets_sold(@pet_shop)
    assert_equal(2, sold)
  end

  def test_stock_count
    count = stock_count(@pet_shop)
    assert_equal(6, count)
  end

  def test_all_pets_by_breed__found
    pets = pets_by_breed(@pet_shop, "British Shorthair")
    assert_equal(2, pets.count)
  end

  def test_all_pets_by_breed__not_found
    pets = pets_by_breed(@pet_shop, "Dalmation")
    assert_equal(0, pets.count)
  end

  def test_find_pet_by_name__returns_pet
    pet = find_pet_by_name(@pet_shop, "Arthur")
    assert_equal("Arthur", pet[:name])
  end

  def test_find_pet_by_name__returns_nil
    pet = find_pet_by_name(@pet_shop, "Fred")
    assert_nil(pet)
  end

  def test_remove_pet_by_name
    remove_pet_by_name(@pet_shop, "Arthur")
    pet = find_pet_by_name(@pet_shop,"Arthur")
    assert_nil(pet)
  end

  # def test_add_pet_to_stock
  #   add_pet_to_stock(@pet_shop, @new_pet)
  #   count = stock_count(@pet_shop)
  #   assert_equal(7, count)
  # end
  #
  def test_customer_cash
    cash = customer_cash(@customers[0])
    assert_equal(1000, cash)
  end

  # def test_remove_customer_cash
  #   customer = @customers[0]
  #   remove_customer_cash(customer, 100)
  #   assert_equal(900, customer[:cash])
  # end

  # def test_customer_pet_count
  #   count = customer_pet_count(@customers[0])
  #   assert_equal(0, count)
  # end

  # def test_add_pet_to_customer
  #   customer = @customers[0]
  #   add_pet_to_customer(customer, @new_pet)
  #   assert_equal(1, customer_pet_count(customer))
  # end
