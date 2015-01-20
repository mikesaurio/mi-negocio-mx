require 'rails_helper'

feature 'A visitor enters the page' do

  before(:all) do
    @inspections = []
    3.times { @inspections << create :inspection }
  end

  scenario 'and sees the root page' do
    visit root_path
    save_and_open_page
    expect(page).to have_content 'Entrar'
  end
end
