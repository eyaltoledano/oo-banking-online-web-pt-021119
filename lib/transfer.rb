require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    "Transaction rejected. Please check your account balance." if !sender.valid?
    
    while self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
  end
end
