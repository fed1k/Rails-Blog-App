require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Akif', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'He is authentic') }

  before { subject.save }

  it 'name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be greater than or equal to zero.' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
