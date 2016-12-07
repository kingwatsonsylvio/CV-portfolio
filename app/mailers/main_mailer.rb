class MainMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.main_mailer.mailer.subject
  #
  def mailer
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.main_mailer.notify_question_author.subject
  #
  def notify_question_author(answer)
    @greeting = "Hi"

    mail to: answer.question.email, from: answer.email
  end
end
