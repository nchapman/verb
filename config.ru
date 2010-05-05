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
    erb = ERB.new(File.open(path) { |f| f.read }, nil, nil, "@erb_output")
    
    @erb_output = "" 
    @render_path = path
    
    @request = Rack::Request.new(env)
    
    @response = Rack::Response.new
    @response["Content-Type"] = "text/html"

    erb.result(binding)
    
    @response.write(@erb_output)

    @response.finish
  end
  
  def layout(name = "layout")
    layout_path = File.join(File.dirname(@render_path), name + ".rhtml")
    
    if File.exists?(layout_path)
      ERB.new(File.open(layout_path) { |f| f.read }, nil, nil, "@erb_output").result(binding)
    else
      yield
    end
  end
end

use Verb

run Rack::File.new("public")
