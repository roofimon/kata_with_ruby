require 'spec_helper'
describe 'Captcha' do
  it 'should return 3 + One if input is 2, 3, 1, 1' do
    captcha = Captcha.new(2, 3, 1, 1)
    captcha.label.should eq '3 + One'
  end

  it 'should return Three + 1 if input is 1, 3, 1, 1' do
    captcha = Captcha.new(1, 3, 1, 1)
    captcha.label.should eq 'Three + 1'
  end

  it 'right operand should return One if input is 2, 3, 1, 1' do
    captcha = Captcha.new(2, 3, 1, 1)
    captcha.right_operand.should eq 'One'
  end

  it 'left operand should return 3 if input is 2, 3, 1, 1' do
    captcha = Captcha.new(2, 3, 1, 1)
    captcha.left_operand.should eq '3'
  end
  it 'left operand should return Three if input is 1,3,1,1' do
    captcha = Captcha.new(1, 3, 1, 1)
    captcha.left_operand.should eq 'Three'
  end
  it 'left operand should return Two if input is 1,2,1,1' do
    captcha = Captcha.new(1, 2, 1, 1)
    captcha.left_operand.should eq 'Two'
  end
  it 'left operand should return One if input is 1,1,1,1' do
    captcha = Captcha.new(1, 1, 1, 1)
    captcha.left_operand.should eq 'One'
  end
  it 'right operand should return 1 if input is 1,3,1,1' do
    captcha = Captcha.new(1, 3, 1, 1)
    captcha.right_operand.should eq '1'
  end
  it 'right operand should return 9 if input is 1,3,1, 9' do
    captcha = Captcha.new(1, 3, 1, 9)
    captcha.right_operand.should eq '9'
  end
  it 'operator should return + if input is 1,3,1, 9' do
    captcha = Captcha.new(1, 3, 1, 9)
    captcha.operator.should eq '+'
  end
  it 'operator should return - if input is 1, 3, 2, 9' do
    captcha = Captcha.new(1, 3, 2, 9)
    captcha.operator.should eq '-'
  end
  it 'operator should return * if input is 1, 3, *, 9' do
    captcha = Captcha.new(1, 3, 3, 9)
    captcha.operator.should eq '*'
  end
end
