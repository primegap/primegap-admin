require 'rails_helper'

RSpec.describe 'Admin::Customer', type: :feature do
  let(:backend_path) { '/admin' }

  before do
    @admin_user  = FactoryGirl.create(:admin_user)
    @customer1 = FactoryGirl.create(:customer)
    @customer2 = FactoryGirl.create(:customer)

    sign_in_with_admin_user(@admin_user, backend_path)
  end

  scenario "GET 'index'" do
    visit "#{backend_path}/customers"

    within '#index_table_customers' do
      expect(page).to have_content(@customer1.email)
      expect(page).to have_content(@customer2.email)
    end
  end

  scenario "GET 'show'" do
    visit "#{backend_path}/customers/#{@customer1.id}"

    expect(page).to have_content(@customer1.email)
  end

  scenario "GET 'new' and create new admin user" do
    visit "#{backend_path}/customers/new"

    within '#new_customer' do
      fill_in 'customer_full_name', with: 'John Doe'
      fill_in 'customer_email', with: 'newcustomer@email.com'
      fill_in 'customer_phone', with: '0123456789'
      click_button 'Create Customer'
    end

    expect(page).to have_content('Customer was successfully created')

    expect(page).to have_content('newcustomer@email.com')
  end

  scenario "GET 'edit' and update admin user" do
    visit "#{backend_path}/customers/#{@customer1.id}/edit"

    within '#edit_customer' do
      fill_in 'customer_email', with: 'updatedcustomer@email.com'
      click_button 'Update Customer'
    end

    expect(page).to have_content('Customer was successfully updated')

    expect(page).to have_content('updatedcustomer@email.com')
  end

  scenario "DELETE 'destroy'" do
    visit "#{backend_path}/customers/#{@customer1.id}"

    click_link 'Delete Customer'

    expect(page).to have_content('Customer was successfully destroyed')

    within '#index_table_customers' do
      expect(page).not_to have_content(@customer1.email)
      expect(page).to have_content(@customer2.email)
    end
  end
end
