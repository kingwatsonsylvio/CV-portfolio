require 'test_helper'

class MainMailerTest < ActionMailer::TestCase
  test "mailer" do
    mail = MainMailer.mailer
    assert_equal "Mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify_question_author" do

    question = Question.create email: 'author@question.com', body: 'a test question'
    answer = Answer.create email: 'author@answer.com', body: 'a test answer'

    question.answer << answer

    mail = MainMailer.notify_question_author(answer)
    assert_equal "New answer to your question", mail.subject

    assert_equal [question.email], mail.to
    assert_equal [answer.email], mail.from

    assert_match answer.body, mail.body.encoded
  end

end
