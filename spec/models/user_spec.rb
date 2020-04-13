require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:email) }
    it { is_expected.to have_db_column(:encrypted_password) }
  end

  describe 'relations' do
    it { is_expected.to have_many(:projects).dependent(:destroy) }
  end
end
