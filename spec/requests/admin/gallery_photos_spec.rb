require 'rails_helper'

RSpec.describe "Admin::GalleryPhotos", type: :request do
  describe "GET /admin/gallery_photos" do
    it "works! (now write some real specs)" do
      get admin_gallery_photos_path
      expect(response).to have_http_status(200)
    end
  end
end
