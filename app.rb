require_relative 'middleware/time_handler'

class App
  def call(env)
    request = Rack::Request.new(env)

    if request.path == '/time' && !request.params['format'].nil?
      responce = TimeHandler.new(request.params['format'])
      body = [responce.result.join("\n").to_s]

      if responce.success?
        [200, headers, body]
      else
        [400, headers, body]
      end
    else
      [404, headers, ['Not Found']]
    end
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end
end
