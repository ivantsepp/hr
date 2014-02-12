require "hr/version"
require "colorize"

module Hr
  extend self

  def get_column_width
    column_width = `tput cols`.to_i
    column_width = 80 if column_width <= 0
    column_width
  end

  def print(*patterns)
    puts string(*patterns)
  end

  def string(*patterns)
    options = patterns.last.is_a?(Hash) ? patterns.pop : {}
    column_width = get_column_width
    output = patterns.map do |pattern|
      pattern = pattern.to_s
      times = (column_width / pattern.length) + 1
      (pattern * times)[0..column_width - 1]
    end.join("\n")
    options = options.inject({}){|tmp,(k,v)| tmp[k.to_sym] = v.to_sym; tmp}
    options.any? ? output.colorize(options) : output
  end

end
