require 'rack'
app = Proc.new do |env|
    ['200', {'Content-Type' => 'text/html'}, ['Teste']]
end

Rack::Handler::WEBrick.run(app, Port: 3000)