module ApplicationHelper
  def menu_status(name)
    name == controller_name ? 'active' : nil
  end
end
