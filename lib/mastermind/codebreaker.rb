class Codebreaker
  def initialize(code)
    @code = code
  end
  
  def guess(guess)
    code = @code.clone
    guess.inject(0) {|matches, number| matches + (code.shift === number ? 1 : 0)}
  end
end