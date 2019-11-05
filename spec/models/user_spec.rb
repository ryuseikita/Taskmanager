require 'rails_helper'

RSpec.describe User, type: :model do
  it "nameが記入されていない場合バリデーションが通らない" do
    user = User.new(id:'10',name: "",email:'specuser02@gmail.com',password:'password',password_confirmation:'password',admin:'true')
    expect(user).not_to be_valid
  end

  it "emailが記入されていない場合バリデーションが通らない" do
    user = User.new(id:'10',name: "user010",email:'',password:'password',password_confirmation:'password',admin:'true')
    expect(user).not_to be_valid
  end

  it "passwordが記入されていない場合バリデーションが通らない" do
    user = User.new(id:'10',name: "user010",email:'user10@gmail.com',password:'',password_confirmation:'password',admin:'true')
    expect(user).not_to be_valid
  end
  it "password_confirmationがpasswordと違った場合バリデーションが通らない" do
    user = User.new(id:'10',name: "user010",email:'user10@gmail.com',password:'password',password_confirmation:'test',admin:'true')
    expect(user).not_to be_valid
  end

  it "adminの記載がなくてもバリデーションが通る" do
    user = User.new(id:'10',name: "user010",email:'user10@gmail.com',password:'password',password_confirmation:'password')
    expect(user).to be_valid
  end

end
