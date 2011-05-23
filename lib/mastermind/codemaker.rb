class Codemaker
  def initialize(length, max=2)
    @length = length
    @max = max
  end

  def make
    @length.times.collect { [@max - 1, rand(@max)].min.to_s }.join
  end
end