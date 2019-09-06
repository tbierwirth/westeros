require 'rails_helper'

RSpec.describe 'As a User' do
  it "when I visit root path and select Greyjoy" do
    it "and I click on get members I should see a list of 7 members" do
      visit root_path
      select 'Greyjoy', from: 'Houses'

      click_on 'Get Members'

      expect(current_path).to eq(search_path('house=greyjoy'))
      expect(page).to have_content('7 Members')

      expect(page).to have_css('.member', count: 7)

      within(first('.member')) do
        expect(page).to have_css('.id')
        expect(page).to have_css('.name')
      end
    end
  end
end
