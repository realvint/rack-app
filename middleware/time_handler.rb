class TimeHandler

  FORMATS = { 'year' => '%Y', 'month' => '%m', 'day' => '%d', 'hour' => '%H', 'minute' => '%m', 'second' => '%S' }.freeze

  attr_reader :params

  def initialize(params)
    @params = params.split(',')
  end

  def success?
    invalid_params.empty?
  end

  def result
    if success?
      [Time.now.strftime(FORMATS.values_at(*@params).join('-'))]
    else
      ["Unknown time format [#{invalid_params.join(', ')}]"]
    end
  end

  private

  def invalid_params
    self.params - FORMATS.keys
  end
end
