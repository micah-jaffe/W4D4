require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validations' do
    subject(:user) do
      FactoryBot.build(:user, email: 'micah@test.com', password: 'password')
    end
    
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }
  end
end
