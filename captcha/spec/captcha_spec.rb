require 'spec_helper'
describe 'final result of captcha' do
  it 'should return 7 as a result' do
    captcha = Captcha.new(1, 9, 2, 2)
    expect(captcha.result).to eq(7)
  end

  it 'should return 6 as a result' do
    captcha = Captcha.new(1, 3, 3, 2)
    expect(captcha.result).to eq 6
  end

  it 'should return 9 as a result' do
    captcha = Captcha.new(2, 5, 1, 4)
    expect(captcha.result).to eq 9
  end

  it 'should return 8 as a result' do
    captcha = Captcha.new(2, 5, 1, 3)
    expect(captcha.result).to eq 8
  end
end

describe 'string label of captcha' do
  it 'should return 3 + One if input is 2, 3, 1, 1' do
    captcha = Captcha.new(2, 3, 1, 1)
    expect(captcha.label).to eq '3 + One'
  end

  it 'should return Three + 1 if input is 1, 3, 1, 1' do
    captcha = Captcha.new(1, 3, 1, 1)
    expect(captcha.label).to eq 'Three + 1'
  end
end

describe 'right operand' do
  it 'right operand should return One if input is 2, 3, 1, 1' do
    captcha = Captcha.new(2, 3, 1, 1)
    expect(captcha.right_operand).to eq 'One'
  end
  it 'right operand should return 1 if input is 1,3,1,1' do
    captcha = Captcha.new(1, 3, 1, 1)
    expect(captcha.right_operand).to eq '1'
  end
  it 'right operand should return 9 if input is 1,3,1, 9' do
    captcha = Captcha.new(1, 3, 1, 9)
    expect(captcha.right_operand).to eq '9'
  end
end

describe 'left operand' do
  it 'left operand should return 3 if input is 2, 3, 1, 1' do
    captcha = Captcha.new(2, 3, 1, 1)
    expect(captcha.left_operand).to eq '3'
  end
  it 'left operand should return Three if input is 1,3,1,1' do
    captcha = Captcha.new(1, 3, 1, 1)
    expect(captcha.left_operand).to eq 'Three'
  end
  it 'left operand should return Two if input is 1,2,1,1' do
    captcha = Captcha.new(1, 2, 1, 1)
    expect(captcha.left_operand).to eq 'Two'
  end
  it 'left operand should return One if input is 1,1,1,1' do
    captcha = Captcha.new(1, 1, 1, 1)
    expect(captcha.left_operand).to eq 'One'
  end
end

describe 'operator' do
  it 'operator should return + if input is 1,3,1, 9' do
    captcha = Captcha.new(1, 3, 1, 9)
    expect(captcha.operator).to eq '+'
  end
  it 'operator should return - if input is 1, 3, 2, 9' do
    captcha = Captcha.new(1, 3, 2, 9)
    expect(captcha.operator).to eq '-'
  end
  it 'operator should return * if input is 1, 3, *, 9' do
    captcha = Captcha.new(1, 3, 3, 9)
    expect(captcha.operator).to eq '*'
  end
end
