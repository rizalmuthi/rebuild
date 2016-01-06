require "erb"

module Rendering
  def render(action)
    response.write render_to_string(action)
  end

  def render_to_string(action)
    path = template_path(action)
    template = ERB.new(File.read(path))
    template.result(binding) # http://ruby-doc.org/core-2.2.0/Binding.html
  end

  def template_path(action)
    "app/views/#{controller_name}/#{action}.html.erb"
  end

  def layout_path
    "app/views/layouts/application.html.erb"
  end

  def controller_name
    self.class.name[/^(\w+)Controller/, 1].downcase # HomeController => "home"
  end
end
