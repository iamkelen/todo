require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to accept_nested_attributes_for(:tasks) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(100) }
  end

  describe 'columns' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
  end
end
