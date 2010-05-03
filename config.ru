require 'erubis'

class Verb
  def call(env) 
    base_path = File.join(Dir.pwd, env["REQUEST_URI"].sub(/\/$/, ""))
    exact_path = base_path + ".rhtml"
    index_path = File.join(base_path, "index.rhtml")
    
    if File.exists?(exact_path)
      render(exact_path, env)
    elsif File.exists?(index_path)
      render(index_path, env)
    else
      [404, {"Content-Type" => "text/plain"}, "404 NOT FOUND"]
    end
  end
  
  def render(path, env)
    erb = Erubis::Eruby.new(File.open(path) { |f| f.read })
    context = {:env => env, :request => Rack::Request.new(env)}
    
    [200, {"Content-Type" => "text/html"}, erb.result(context)]
  end
end

run Verb.new