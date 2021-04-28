
require 'pry'

class CashRegister
    attr_accessor :total, :discount, :last_transaction 

    def initialize(discount=0, total=0)
        @total = total 
        @discount = discount
        @last_transaction = Array.new
        @items = Array.new
    end

    def items
        @items
    end

    def add_item(item, amount, quantity=1)
        self.total += amount * quantity
        self.last_transaction.push({"#{amount}"=> quantity})
        while quantity > 0 do 
            self.items.push(item)
            quantity = quantity - 1
        end
            
    end

    def apply_discount
        if discount == 0 
            return "There is no discount to apply."
        end
        self.total = self.total - (self.total * self.discount / 100 ).to_i
        "After the discount, the total comes to $#{self.total}."
    end

    def void_last_transaction
        self.last_transaction.pop().each do |amount, quantity|
            self.total -= amount.to_s.to_f * quantity
            while quantity > 0 do
                self.items.pop()
                quantity = quantity - 1
            end
        end
    end
    
end