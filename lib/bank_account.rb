require_relative 'transfer'

class BankAccount

    attr_reader :name, :deposit, :display_balance
    attr_accessor :balance, :status

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"

        @@all << self
    end

    def deposit(deposit)
        self.balance += deposit
    end

    def display_balance
        "Your balance is $" + balance.to_s + "."
    end
  
    def valid?
        if self.status == "open" && self.balance > 0
            true
        else
            false
        end
    end

    def self.all
        @self
    end

    def close_account
        self.status = "closed"
    end
end
