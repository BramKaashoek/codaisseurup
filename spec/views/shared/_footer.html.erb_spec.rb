require "rails_helper"

describe "shared/_footer.html.erb" do
 it "there is a footer with the text terms and conditions" do
   render
   expect(rendered).to have_content("Terms and Conditions")
 end
end
