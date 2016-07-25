require 'rails_helper'

RSpec.describe School, type: :model do
  let!(:school1) { School.first }

  it 'should have many lessons' do
    expect(school1.lessons.length).to eq 4
  end

  it 'should return sequenced lessons' do
    school1 = School.first
    expect(school1.sequenced_lessons.map(&:id)).to eq school1.sequences.first.sequence_ids
  end
end
