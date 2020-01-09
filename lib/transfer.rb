require_relative "bank_account.rb"
# require 'pry'
class Transfer
  attr_accessor :amount, :status
  attr_reader :receiver, :sender
  @@all = []
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

    @@all << self
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @status == "pending" && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.execute_transaction
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
    end

  end

  def self.all
    @self
  end
end 

# otha = BankAccount.new("otha")
# jin = BankAccount.new("Jin")
# t1 = Transfer.new(jin, otha, 999)

# # binding.pry
# "run"