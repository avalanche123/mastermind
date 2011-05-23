class Codebreaker
  def initialize(code)
    @code = code.split('')
  end

  def guess(guess)
    code = @code.clone
    guess.split('').inject(0) {|matches, number| matches + (code.shift === number ? 1 : 0)}
  end
end