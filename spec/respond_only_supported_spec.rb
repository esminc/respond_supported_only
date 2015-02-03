RSpec.describe FooController, type: :controller do
  context 'GET hi / simple access (text/xhtml by default)' do
    specify 'returns 200' do
      get :hi

      expect(response).to be_success
    end
  end
end
