class Transaction < ApplicationRecord

  def total_calc
    if self.currency == 'dollar' && self.transaction_type == 'sell'
      self.total = self.amount * - 1
    elsif self.currency == 'real' && self.transaction_type == 'buy'
      self.total = self.amount / self.quotation
    end
  end

  def total_to_s
    '$ %.2f' % self.total
  end

end
