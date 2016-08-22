require 'rails_helper'

RSpec.describe "Functionality", :type => :request do

  describe 'Lists' do

    let!(:user) { FactoryGirl.create(:user) }

    before { sign_in(user) }

    describe 'Create' do
      let (:list) {FactoryGirl.build(:list) }

      it 'should create new list' do
        visit new_list_path

        fill_in 'Title', with: list.title
        fill_in 'Descriotion', with: list.descriotion
        click_button 'Ok'
        visit lists_path

        page.should have_content list.title
        page.should have_content list.descriotion
        
      end
    end
=begin
    describe 'Delete', js: true do
      it 'should Delete list' do
        list = FactoryGirl.create(:list, user: user) 
        visit lists_path

        #page.find("img[alt='delete']").first.click
        click_link "delete-#{list.id}"
        visit lists_path

        page.should_not have_content(list.title)
        
      end
    end
=begin

     describe 'Edit', js: true do
      let (:new_list_title) { 'New title' }
      

      it 'should edit list' do
        list = FactoryGirl.create(:list, user: user) 
        visit root_path

        click_link "edit-#{list.id}"
        fill_in 'Title', with: new_list_title
        click_button 'Ok'
        visit lists_path
        page.should have_content(new_list_title)
        
      end
    end
=end
  end






  

end
