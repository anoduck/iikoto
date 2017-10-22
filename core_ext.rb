class Time
  def elapsed
    elapsed = (Time.now - self).to_i
    name = if elapsed < 60
             'second'
           elsif elapsed /= 60 < 60
             'minute'
           elsif elapsed /= 60 < 60
             'hour'
           elsif elapsed /= 24 < 24
             'day'
           elsif elapsed / 7 < 7
             elapsed /= 7
             'week'
           elsif elapsed / 30 < 30
             elapsed /= 30
             'month'
           else
             elapsed /= 365
             'year'
           end

    name += 's' if elapsed > 1
    "#{elapsed} #{name} ago"
  end
end

class String
  def tripcode
    salt = self[1..2].chars.map do |char|
      case char
      when ':'  then 'A'
      when ';'  then 'B'
      when '<'  then 'C'
      when '='  then 'D'
      when '>'  then 'E'
      when '?'  then 'F'
      when '@'  then 'G'
      when '['  then 'a'
      when '\\' then 'b'
      when ']'  then 'c'
      when '^'  then 'd'
      when '_'  then 'e'
      when '`'  then 'f'
      when '.'..'z' then char
      else '.'
      end
    end.join

    crypt(salt).chars.last(10).join
  end

  def formatted_tripcode
    Rack::Utils.escape_html(self).gsub(/\#(.{3,}$)/) do
      "<span class=\"tripcode\">!#{Regexp.last_match(1).tripcode}</span>"
    end
  end
end
