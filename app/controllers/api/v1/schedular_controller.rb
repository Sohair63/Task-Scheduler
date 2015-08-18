class Api::V1::SchedularController < Api::ApiController

  # GET
  def tasks
    response = {}
    response = Task.get_all
    render_api response
  end

end
