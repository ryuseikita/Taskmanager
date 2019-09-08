require 'rails_helper'

RSpec.describe Task, type: :model do

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(details: 'test', deadline: '2019/08/26', priority: '0',status:'未着手')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(title:'test' , deadline: '2019/08/26', priority: '0',status:'未着手')
    expect(task).not_to be_valid
  end

  it "deadlineが空ならバリデーションが通らない" do
    task = Task.new(title:'test' ,details: 'test', priority: '0',status:'未着手')
    expect(task).not_to be_valid
  end

  it "priorityが空ならバリデーションが通らない" do
    task = Task.new(title:'test' ,details: 'test', deadline: '2019/08/26',status:'未着手')
    expect(task).not_to be_valid
  end

  it "statusが空ならバリデーションが通らない" do
    task = Task.new(title:'test' ,details: 'test', deadline: '2019/08/26', priority: '0')
    expect(task).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(title:'test' ,details: 'test', deadline: '2019/08/26', priority: '0',status:'未着手')
    expect(task).to be_valid
  end
end
