class Board < ActiveRecord::Base
  def yarns
    columns = %i[number locked subject updated]
    Yarn.where(board: route).order(:updated).select(*columns)
  end
end
