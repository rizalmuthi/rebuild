require "rendering"

module ActionController
  class Base
    include Rendering
    attr_accessor :request, :response

    def process(action)
      # action == "index"
      # `send "index"` same as `index`
      send action # calls index
    end

    def params
      request.params
    end
  end
end

