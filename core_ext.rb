class Time
  def elapsed
    elapsed = (Time.now - self).to_i
    name = if 60 > elapsed
             'second'
           elsif 60 > elapsed /= 60
             'minute'
           elsif 60 > elapsed /= 60
             'hour'
           elsif 24 > elapsed /= 24
             'day'
           elsif 7 > elapsed / 7
             elapsed /= 7
             'week'
           elsif 30 > elapsed / 30
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
    salt = self[1..2].chars.map { |char|
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
    }.join

    self.crypt(salt).chars.last(10).join
  end

  def formatted_tripcode
    Rack::Utils.escape_html(self).gsub(/\#(.{3,}$)/) {
     "<span class=\"tripcode\">!#{$1.tripcode}</span>"
    }
  end
end
