class EchoController < ApplicationController

  def index
    response.write "Hello from Echo"
  end
end
