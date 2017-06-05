require_relative 'spec_helper'
require 'json'

describe 'Check if service root is valid' do
  it 'should return ok' do
    get '/'
    last_response.must_be :ok?
  end
end

# describe 'Check api services' do
#   it 'shoul list the roles' do
#     get '/api/roles.json'
#   end
# end

describe 'Creating new users' do
    before do
      User.dataset.delete
    end

    it 'HAPPY: should create a new unique user' do
      req_header = { 'CONTENT_TYPE' => 'application/json' }
      req_body = {
        first_name: "Paul",
        last_name: "Rivera",
        username: "privera",
        birthday: "1991/04/12",
        country: "Honduras",
        city: "Tegucigalpa",
        password: "12345",
        img_path: ""
      }.to_json
      post '/api/users/', req_body, req_header
      _(last_response.status).must_equal 201
      _(JSON.parse(last_response.body)['id']).wont_be_nil
    end
  end