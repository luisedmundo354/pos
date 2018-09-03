module ProductsHelper
  #Change row color helper
  def row_class(level)
    if level === "Alto"
      ''
    elsif level === "Medio"
      ''
    elsif level === "Bajo"
      'bg-warning'
    else level === "Reponer"
      'bg-danger'
    end
  end
end
