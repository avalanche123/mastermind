module MastermindHelper
  def guess_input_tag(name, n, max=2, options = {})
    raw(n.times.collect do |n|
      select_tag("#{name}[#{n}]", options_for_select(max.times.collect), options)
    end.join)
  end
end
