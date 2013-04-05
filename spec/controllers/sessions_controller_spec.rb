require 'spec_helper'

describe SessionsController do
  describe "#new" do
    context "when not signed in" do
      before :each do
        get :new
      end

      it { response.should be_success }
    end

    context "when already signed in" do
      before :each do
        session[:destination] = '/abc'
        session[:signed_in] = true
        get :new
      end

      it { should redirect_to('/abc') }
      it { expect(session[:destination]).to be_nil }
    end
  end

  describe "#create" do
    let(:password) { "nonsense" }

    before :each do
      post :create, password: password
    end

    it { should redirect_to(:sign_in) }

    context "when signing in with a valid password" do
      let(:password) { "password" }

      it { should redirect_to(:root) }
    end
  end
end
