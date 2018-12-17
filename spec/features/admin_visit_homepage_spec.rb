require 'rails_helper'

feature 'Admin visit homepage' do
  scenario 'successfully' do
    visit "/"
    expect(page).to have_content('Bem-vindo ao sistema de trocas de moedas')
  end
end
