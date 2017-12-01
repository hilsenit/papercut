module ApplicationHelper
  def show_category_string_helper attr
    case attr
    when "laes"
      "Læs"
    when "hoer"
      "Hør"
    else
      "Se"
    end
  end
end

