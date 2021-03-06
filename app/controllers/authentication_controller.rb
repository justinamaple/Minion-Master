class AuthenticationController < ActionController::Base
  def login
    @account = Account.find_by(email: params[:email])
    if @account && @account.authenticate(params[:password])
      session[:account_id] = @account.id
      redirect_to @account
    else
      flash[:secondary] = "Email and Password combination was incorrect."
      redirect_to accounts_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end
end
