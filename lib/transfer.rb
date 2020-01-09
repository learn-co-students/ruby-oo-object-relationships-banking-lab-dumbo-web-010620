# require 'pry'
require_relative 'bank_account.rb'

class Transfer

  attr_reader :sender, :receiver, :amount, :status
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.amount < self.sender.balance
      self.sender.valid?
      self.receiver.valid?
    end
  end

  def execute_transaction
    if self.valid?

      if self.status == "pending"
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
  end 
end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end


 


end

# binding.pry
# 0