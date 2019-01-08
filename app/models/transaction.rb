class Transaction < ApplicationRecord
  belongs_to :user
  validates :amount, :currency, :transaction_type, :quotation, :user_id, presence: true

  def total_calc
    if self.currency == 'dollar' && self.transaction_type == 'sell'
      self.total = self.amount * - 1
    elsif self.currency == 'real' && self.transaction_type == 'buy'
      self.total = self.amount / self.quotation
    elsif self.currency == 'dollar' && self.transaction_type == 'buy'
      self.total = self.amount
    elsif self.currency == 'real' && self.transaction_type == 'sell'
      self.total = self.amount * self.quotation
    end
  end

  def total_to_s
    '$ %.2f' % self.total
  end

  def quotation_to_s
    '$ %.2f' % self.quotation
  end

  def currency_translate
    self.currency == 'dollar' ? 'Dólar' : 'Real'
  end

  def transaction_type_translate
    self.transaction_type == 'sell' ? 'Venda' : 'Compra'
  end
end
