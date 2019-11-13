require 'rails_helper'

RSpec.describe Label, type: :model do
  it "nameがからの場合バリデーションエラーになることを確認する" do
    label = Label.create(id:'10',name:'')
    expect(label).not_to be_valid
  end
end
