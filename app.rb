require_relative 'services/time_handler'

class App
  def call(env)
    request = Rack::Request.new(env)

    if request.params['format'].nil?
      @response = Rack::Response.new('enter params', 200)
    else
      date_time = TimeHandler.new(request.params)
      body = date_time.result

      @response = if date_time.success?
                    Rack::Response.new(body, 200)
                  else
                    Rack::Response.new(body, 400)
                  end
    end
    @response.finish
  end
end
