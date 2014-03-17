class AnalysisService < SimpleDelegator
  attr_reader :analysis_options

  def initialize(params)
    params.assert_valid_keys :type
    type = params[:type]

    case type
    when "tested_paths"
      super(TestedPaths.new)
    when "tested_controllers"
      super(TestedControllers.new)
    else
      raise "unsupported analysis_type: #{type}"
    end

    self.setup(params)
  end
end