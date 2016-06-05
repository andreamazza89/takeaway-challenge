describe 'Features' do

  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with prices
  describe 'A customer prints the menu to see available dishes/prices' do
    it 'TakeAway.show_menu displays the menu in the terminal window' do
      expect { TakeAway.show_menu }.to output(
        "1 - Roast pork - £15\n"\
        "2 - Steamed broccoli - £3\n"\
        "3 - Roasted spinach - £8\n"\
        "4 - Smelly fruit - £12\n").to_stdout
    end
  end 


  #As a customer
  #So that I can order the meal I want
  #I would like to be able to select some number of several available dishes
  describe 'A customer selects a number of available dishes' do
    it 'Takeaway.order allows the user to place an order' do
      expect { TakeAway.order(18, {item_n: 1, quantity: 1}, {item_n: 2, quantity: 1}) }.not_to raise_error
    end
  end


  #As a customer
  #So that I can verify that my order is correct
  #I would like to check that the total I have been given 
  #matches the sum of the various dishes in my order 
  describe 'A customer provides the wrong total' do
    it 'TakeAway.order raises an error' do
      price_error = TakeAway::PRICE_ERROR
      expect { TakeAway.order(19, {item_n: 1, quantity: 1}, {item_n: 2, quantity: 1}) }.to raise_error(price_error)
    end
  end
end 