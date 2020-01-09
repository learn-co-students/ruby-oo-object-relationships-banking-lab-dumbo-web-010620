require 'pry'
require_relative 'bank_account'
class Transfer
  
  attr_reader :sender, :receiver, :status
  attr_accessor :amount

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