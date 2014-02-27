require 'spec_helper'

describe User do
  before { @user = User.new(email: "user@example.com")}

  subject { @user }

  it {should respond_to(:email) }
end



# test "should not save post without title" do
#   post = Post.new
#   assert !post.save
# end