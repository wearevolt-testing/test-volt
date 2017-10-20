class ReportMailer < ApplicationMailer

  def by_author_email(params)
    @date_range = params[:start_date]..params[:end_date]
    @users = User.all.sort_by { |user| user.by_author_index(@date_range) }.reverse

    mail(to: params[:email], subject: 'Отчет готов!')
  end
end
