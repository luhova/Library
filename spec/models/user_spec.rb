require "../../app/models/user"
require "../spec_helper"

describe User do
  it "requires a name to be present" do
    expect(User.create(name: nil).valid?).to be false
    expect(User.create(password: "12345678", access: "admin").valid?).to be false
    expect(User.create(name: "gaby", password: "12345678", access: "user").valid?).to be true
  end

  it "requires a password to be present" do
    expect(User.create(password: :nil).valid?).to be false
    expect(User.create(name: "gaby", access: "admin").valid?).to be false
    expect(User.create(name: "gaby", password: "12345678", access: "user").valid?).to be true
  end

  it "requires access to be present" do
    expect(User.create(access: :nil).valid?).to be false
    expect(User.create(name: "gaby", password: "12345678").valid?).to be false
    expect(User.create(name: "gaby", password: "12345678", access: "user").valid?).to be true
  end

  it "requires the password to be at least 8 symbols long" do
    expect(User.create(name: "gaby",
                       password: "12345678",
                       access: "admin").valid?).to be true
    expect(User.create(name: "gaby", password: "12").valid?).to be false
  end
end