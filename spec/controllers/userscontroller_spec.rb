require_relative "../spec_helper"
require_relative "../factories.rb"
require_relative "../../app/models/user"
require_relative "../../app/views/users_view"

describe UsersController do
  user = FactoryGirl.create(:user, name: "gaby", password: )
end