require "pry"

class CashRegister

    attr_accessor :total, :discount, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
    end

    def add_item(title, ammount, quantity = 1)
        self.last_transaction = ammount * quantity
        self.total += self.last_transaction
    end
    
    def apply_discount
        if self.discount != 0
          discount_as_percent = (100.0 - self.discount.to_f) / 100
          self.total = (self.total * discount_as_percent).to_i
          "After the discount, the total comes to $#{self.total}."
        else
          "There is no discount to apply."
        end
      end
    
      def void_last_transaction
        self.total -= self.last_transaction
      end

end

cash_register = CashRegister.new(300)
binding.pry
