# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base
  default from: "painkiller778@gmail.com"

  def tell_user(user)
    @user = user
    mail(:to => user.email, :subject => "Olimpíadas infantis 2012")
  end
end
