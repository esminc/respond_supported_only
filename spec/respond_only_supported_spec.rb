require 'respond_supported_only'

RSpec.describe FooController, type: :controller do
  before(:all) do
    FooController.class_eval do
      include RespondSupportedOnly

      respond_only :html
    end
  end

  context 'GET hi / simple access (text/xhtml by default)' do
    specify 'returns 200' do
      get :hi

      expect(response).to be_success
    end
  end

  context 'GET hi with Accept: */*' do
    before do
      request.accept = '*/*'
    end

    specify 'returns 200' do
      get :hi

      expect(response).to be_success
    end
  end

  context 'GET hi with Accept: image/png' do
    before do
      request.accept = 'image/png'
    end

    specify 'returns 406' do
      get :hi

      expect(response.status).to eq 406
    end
  end
end
