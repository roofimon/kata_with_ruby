class Captcha
  TEXT_OPERATOR_NUMBER = 1
  NUMBER_OPERATOR_TEXT = 2
  PLUS = 1
  MINUS = 2
  MULTIPLY = 3

  @@number_wording = { '1' => 'One', '2' => 'Two', '3' => 'Three', '4' => 'Four', 5 => 'Five', 6 => 'Six', 7 => 'Seven', 8 => 'Eight', 9 => 'Nine' }

  def initialize(pattern, left_operand, operator, right_operand)
    @pattern = pattern
    @left_operand = left_operand
    @operator = operator
    @right_operand = right_operand
  end

  def result()
    case @operator
    when PLUS
      @left_operand + @right_operand
    when MINUS
      @left_operand - @right_operand
    when MULTIPLY
      @left_operand * @right_operand
    end
  end

  def label()
    "#{left_operand} #{operator} #{right_operand}"
  end

  def left_operand()
    return @@number_wording[@left_operand.to_s] if @pattern == TEXT_OPERATOR_NUMBER
    return @left_operand.to_s if @pattern == NUMBER_OPERATOR_TEXT
  end

  def operator
    { '1' => '+', '2' => '-', '3' => '*' }.fetch @operator.to_s
  end

  def right_operand()
    return @@number_wording[@right_operand.to_s] if @pattern == NUMBER_OPERATOR_TEXT
    return @right_operand.to_s if @pattern == TEXT_OPERATOR_NUMBER
  end
end
