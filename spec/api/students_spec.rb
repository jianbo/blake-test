require 'airborne'
require 'rails_helper'

describe 'student spec' do

  let!(:student) { create(:student) }

  it 'should get student details' do
    get '/api/v1/students/1'
    p "...#{response.body.inspect}"
    expect_status(200)
  end
end