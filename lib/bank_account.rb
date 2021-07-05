class BankAccount
    attr_reader :name
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
            return true
        else 
            false
        end
    end

    def close_account
        self.status = "closed"
    end

    def self.all
        @self
    end
end
