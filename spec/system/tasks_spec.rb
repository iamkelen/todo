require 'rails_helper'

RSpec.describe 'Creating Task', type: :system do
  context 'when create a new task' do
    let(:user) { create :user }
    let(:project) { create :project, user: user }
    it 'creates a task' do
      sign_in user
      project
      visit projects_path
      fill_in 'inputAddTask', with: 'My first task'
      fill_in 'inputDate', with: Date.tomorrow
      click_button 'Add Task'
      expect(page).to have_text('Task was successfully created.')
    end

    it 'returns validation errors' do
      sign_in user
      project
      visit projects_path
      click_button 'Add Task'
      expect(page).to have_content 'can\'t be blank'
    end
  end

  context 'when update an existing task' do
    let(:user) { create :user }
    let(:project) { create :project, user: user }
    let(:task) { create(:task, project: project) }
    it 'successfully updates the task' do
      sign_in user
      project
      task
      visit projects_path
      find(:css, 'i.t_edit-test').click
      fill_in 'Title', with: 'My edited task'
      click_button 'Update Task'
      expect(page).to have_content 'Task was successfully updated.'
      expect(page).to have_content 'My edited task'
    end
  end

  context 'when delete an existing task' do
    let(:user) { create :user }
    let(:project) { create :project, user: user }
    let(:task) { create(:task, project: project) }
    it 'successfully deletes the task' do
      sign_in user
      project
      task
      visit projects_path
      accept_confirm do
        find(:css, 'i.t_trash-test').click
      end
      expect(page).not_to have_content 'My task'
    end
  end

  context 'when mark an existing task as complete' do
    let(:user) { create :user }
    let(:project) { create :project, user: user }
    let(:task) { create(:task, project: project) }
    it 'successfully completes the task' do
      sign_in user
      project
      task
      visit projects_path
      find(:css, 'i.t_uncompl').click
      expect(page).to have_content 'Task was successfully completed.'
    end
  end

  context 'when change position for existing task' do
    let(:user) { create :user }
    let(:project) { create :project, user: user }
    let(:task) { create(:task, project: project) }
    it 'successfully completes the task' do
      sign_in user
      project
      task
      task
      visit projects_path
      find(:css, 'i.t_uncompl').click
      expect(page).to have_content 'Task was successfully completed.'
    end
  end
end
