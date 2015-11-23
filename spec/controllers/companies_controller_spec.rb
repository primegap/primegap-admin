require 'rails_helper'

RSpec.describe 'Admin::Company', type: :feature do
  let(:backend_path) { '/admin' }

  before do
    @admin_user = FactoryGirl.create(:admin_user)
    @company1 = FactoryGirl.create(:company)
    @company2 = FactoryGirl.create(:company)

    sign_in_with_admin_user(@admin_user, backend_path)
  end

  scenario "GET 'index'" do
    visit "#{backend_path}/companies"

    within '#index_table_companies' do
      expect(page).to have_content(@company1.name)
      expect(page).to have_content(@company2.name)
    end
  end

  scenario "GET 'show'" do
    visit "#{backend_path}/companies/#{@company1.id}"

    expect(page).to have_content(@company1.name)
  end

  scenario "GET 'new' and create new company" do
    visit "#{backend_path}/companies/new"

    within '#new_company' do
      fill_in 'company_name', with: 'NewCompany Inc.'
      click_button 'Create Company'
    end

    expect(page).to have_content('Company was successfully created')

    expect(page).to have_content('NewCompany Inc.')
  end

  scenario "GET 'edit' and update company" do
    visit "#{backend_path}/companies/#{@company1.id}/edit"

    within '#edit_company' do
      fill_in 'company_name', with: 'New Company Inc.'
      click_button 'Update Company'
    end

    expect(page).to have_content('Company was successfully updated')

    expect(page).to have_content('New Company Inc.')
  end

  scenario "DELETE 'destroy' company" do
    visit "#{backend_path}/companies/#{@company1.id}"

    click_link 'Delete Company'

    expect(page).to have_content('Company was successfully destroyed')

    within '#index_table_companies' do
      expect(page).not_to have_content(@company1.name)
      expect(page).to have_content(@company2.name)
    end
  end
end
