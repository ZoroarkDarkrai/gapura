require 'rails_helper'

RSpec.describe "Admin::Sponsors", type: :request do
  describe "GET /admin/sponsors" do
    it "works! (now write some real specs)" do
      get admin_sponsors_path
      expect(response).to have_http_status(200)
    end
  end
end
