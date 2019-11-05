require 'rails_helper'

RSpec.describe Task, type: :model do
  it "titleが空ならバリデーションが通らない" do
    User.create(id:'10',name:'specuser02',email:'specuser02@gmail.com',password:'password',password_confirmation:'password',admin:'false')
    task = Task.new(details: 'test', deadline: '2019/08/26', priority: 'low',status:'未着手',user_id:'10')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    User.create(id:'10',name:'specuser02',email:'specuser02@gmail.com',password:'password',password_confirmation:'password',admin:'false')
    task = Task.new(title:'test' , deadline: '2019/08/26', priority: 'low',status:'未着手',user_id:'10')
    expect(task).not_to be_valid
  end

  it "deadlineが空ならバリデーションが通らない" do
    User.create(id:'10',name:'specuser02',email:'specuser02@gmail.com',password:'password',password_confirmation:'password',admin:'false')
    task = Task.new(title:'test' ,details: 'test', priority: 'low',status:'未着手',user_id:'10')
    expect(task).not_to be_valid
  end

  it "priorityが空ならバリデーションが通らない" do
    User.create(id:'10',name:'specuser02',email:'specuser02@gmail.com',password:'password',password_confirmation:'password',admin:'false')
    task = Task.new(title:'test' ,details: 'test', deadline: '2019/08/26',status:'未着手',user_id:'10')
    expect(task).not_to be_valid
  end

  it "statusが空ならバリデーションが通らない" do
    User.create(id:'10',name:'specuser02',email:'specuser02@gmail.com',password:'password',password_confirmation:'password',admin:'false')
    task = Task.new(title:'test' ,details: 'test', deadline: '2019/08/26', priority: 'low',user_id:'10')
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    User.create(id:'10',name:'specuser02',email:'specuser02@gmail.com',password:'password',password_confirmation:'password',admin:'false')
    task = Task.new(title:'test' ,details: 'test', deadline: '2019/08/26', priority: 'low',status:'未着手',user_id: '10')
    expect(task).to be_valid
  end

end
