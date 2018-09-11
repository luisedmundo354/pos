module ProductsHelper
  #Change row color helper
  def row_class(level)
    if level === "Alto"
      ''
    elsif level === "Medio"
      ''
    elsif level === "Bajo"
      'table-warning'
    else level === "Reponer"
      'table-danger'
    end
  end
end
