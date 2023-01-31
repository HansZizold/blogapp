require 'rails_helper'

RSpec.describe UsersController, type: :request do
  it 'Expect a response code 200 and render from the view index' do
    get users_path
    expect(response).to render_template(:index)
    expect(response).to have_http_status(200)
    expect(response.body).to include('Gabriela')
  end

  it 'Expect a response code 200 and render from the view show' do
    get '/users/22'
    expect(response).to render_template(:show)
    expect(response).to have_http_status(200)
    expect(response.body).to include('BIO')
  end
end
