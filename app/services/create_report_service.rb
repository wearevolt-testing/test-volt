class CreateReportService
  attr_reader :success, :message

  PARAMS = %i[start_date end_date email]
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  def call
    create_report(@report_name)
    self
  end

  private

  def initialize(report_name, context)
    @report_name = report_name
    @context     = context
    @success     = true
    @message = I18n.t('service.create_report.errors.messages.generation_started')
  end

  def create_report(report_name)
    return unless validation_params
    send(@report_name)
  end

  def by_author
    ReportMailer.by_author_email(context_params[:email]).deliver_later
  end

  def validation_params
    key_params_validation
    date_validation(PARAMS)
    email_validation(context_params[:email])
  rescue

    @message = I18n.t('service.create_report.errors.messages.invalid_params')
    @success = false
  end

  def key_params_validation
    context_params.fetch_values(*PARAMS.map(&:to_s))
  end


  def email_validation(email)
    raise ArgumetError unless email =~ VALID_EMAIL_REGEX
    true
  end

  def date_validation(params)
    date_params = params.dup
    date_params.delete(:email)
    date_params.each { |parametr| Date.parse(context_params[parametr]) }
  end

  def context_params
    @context.params.permit(*PARAMS).to_h
  end
end
