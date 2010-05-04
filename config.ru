require 'erb'

class Verb
  def initialize(app)
    @app = app
  end
  
  def call(env)
    base_path = File.join(Dir.pwd, env["PATH_INFO"].sub(/\/$/, ""))
    exact_path = base_path + ".rhtml"
    index_path = File.join(base_path, "index.rhtml")
    
    if File.exists?(exact_path)
      render(exact_path, env)
    elsif File.exists?(index_path)
      render(index_path, env)
    else
      @app.call(env)
    end
  end
  
  def render(path, env)
    erb = ERB.new(File.open(path) { |f| f.read })
    
    request = Rack::Request.new(env)
    response = Rack::Response.new
    
    response.status = 200
    response["Content-Type"] = "text/html"
    
    response.write(erb.result(binding))
    
    response.finish
  end
end

use Verb

run Rack::File.new("public")