require_relative 'admin'
require_relative 'board'
require_relative 'yarn'

class Imageboard
  # This is the route for the homepage.
  get '/' do
    locals = {
      title: ($CONFIG[:site_name]).to_s,
      type: 'front',
      boards: Board.all
    }

    slim :home, locals: locals
  end
end
