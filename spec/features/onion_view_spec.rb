require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the onion view', type: feature do
    describe 'index view' do
        before(:each) do
            Onion.create(title: 'Hidden wiki')
        end

        it 'should list onions correctly' do
            visit onions_path
            expect(page).to have_content('Listing onions')
            expect(page).to have_content('Hidden wiki')
        end
    end
end
