require "pry"
class SessionController < ApplicationController


def create
  sign_in(User.from_facebook(env['omniauth.auth']))
  redirect_to root_url
end

  

end