class TimeHandler
  TIME_FORMAT_MAPPING = { 'year' => '%Y', 'month' => '%m', 'day' => '%d', 'hour' => '%H', 'minute' => '%m', 'second' => '%S' }.freeze

  def initialize(params)
    @params = params['format']&.split(',')
  end

  def success?
    invalid_params.empty?
  end

  def result
    if success?
      Time.now.strftime(TIME_FORMAT_MAPPING.values_at(*@params).join('-'))
    else
      "Unknown time format [#{invalid_params.join(', ')}]"
    end
  end

  private

  def invalid_params
    @params - TIME_FORMAT_MAPPING.keys
  end
end
