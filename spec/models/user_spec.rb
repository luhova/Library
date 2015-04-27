require "../../app/models/user"
require "../spec_helper"

describe User do
  it "requires a name to be present" do
    expect(User.create(name: nil).valid?).to be false
  end

  it "requires a password to be present" do
    expect(User.create(password: :nil).valid?).to be false
  end

  it "requires access to be present" do
    expect(User.create(access: :nil).valid?).to be false
  end

  it "requires the password to be at least 8 symbols long" do
    expect(User.create(name: "gaby", password: 12345678))
  end
end