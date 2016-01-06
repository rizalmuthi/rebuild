## lib/application.rb

require "action_controller"
require "application_controller"
require "router"
require "config/routes"

class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info)

    controller_class = load_controller_class(controller_name) # HomeController
    controller = controller_class.new
    controller.request = request
    controller.response = response
    controller.process(action_name)

    response.finish
  end

  def route(path)
    Routes.recognize(path)
  end

  def load_controller_class(name)
    require "#{name}_controller"
    Object.const_get name.capitalize + "Controller" # HomeController
  end
end

