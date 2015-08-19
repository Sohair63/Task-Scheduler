class Api::V1::SchedularController < Api::ApiController

  before_filter :verify_data, only: :schedule_task

  # GET
  def tasks
    response = {}
    response = Task.get_all
    render_api response
  end

  # POST
  def schedule_task
    task = Task.create_or_schedual_task(params)
    return render_api_error error: "Someting wrong" if task.blank?
    response = {}
    response[:message] = "Your task with ID #{task.to_param} has been scheduled"

    render_api response
  end

  private

  def verify_data
    return render_api_error error: "Missing NAME"            if params[:name].blank?
    return render_api_error error: "Missing RUN TIME"        if params[:run_at].blank?
    return render_api_error error: "Missing PATH"            if params[:path].blank?

    if params[:run_at].present?
      begin
        params[:run_at].to_datetime
      rescue => e
        Rails.logger.tagged("INVALID START DATE #{params[:run_at]}") {
          Rails.logger.info e.message
          Rails.logger.info e.backtrace
        }
        return render_api_error error: "INVALID START DATE"
      end
    end
  end

end
