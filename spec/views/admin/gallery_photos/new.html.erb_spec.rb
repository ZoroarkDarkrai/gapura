require 'rails_helper'

RSpec.describe "admin/gallery_photos/new", type: :view do
  before(:each) do
    assign(:admin_gallery_photo, Admin::GalleryPhoto.new())
  end

  it "renders new admin_gallery_photo form" do
    render

    assert_select "form[action=?][method=?]", admin_gallery_photos_path, "post" do
    end
  end
end
