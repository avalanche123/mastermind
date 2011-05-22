class Codemaker
  def initialize(length, max=2)
    @length, @max = length, max
  end

  def make
    @length.times.collect_concat { rand(@max) }
  end
end