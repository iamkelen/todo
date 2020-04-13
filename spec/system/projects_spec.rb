require 'rails_helper'

RSpec.describe 'Creating Project', type: :system do
  context 'when create a new project' do
    let(:user) { create :user }
    it 'creates a project' do
      sign_in user
      visit projects_path
      click_link('Add TODO List')
      fill_in 'Title', with: 'My first project'
      click_button 'Create Project'
      expect(page).to have_text('Project was successfully created.')
    end

    it 'returns validation errors' do
      sign_in user
      visit new_project_path
      click_button 'Create Project'
      expect(page).to have_content 'can\'t be blank'
    end
  end

  context 'when update an existing project' do
    let(:user) { create :user }
    let(:project) { create :project, user: user }
    it 'successfully updates the project' do
      sign_in user
      project
      visit projects_path
      find(:css, 'i.pr_edit-test').click
      fill_in 'Title', with: 'My edited project'
      click_button 'Update Project'
      expect(page).to have_content 'Project was successfully updated.'
      expect(page).to have_content 'My edited project'
    end
  end

  context 'when delete an existing project' do
    let(:user) { create :user }
    let(:project) { create :project, user: user }
    it 'successfully deletes the project' do
      sign_in user
      project
      visit projects_path
      accept_confirm do
        find(:css, 'i.pr_trash-test').click
      end
      expect(page).not_to have_content 'My project'
    end
  end
end
