class ReportMailer < ApplicationMailer

  def by_author_email(email)
    sleep 10
    mail(to: email, subject: 'Отчет готов!')
  end
end
