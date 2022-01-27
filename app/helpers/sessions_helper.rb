module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    # Guard against session replay attacks.
    # See https://bit.ly/33UvK0w for more.
    session[:session_token] = user.session_token
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if (user_id = session[:user_id])
      user = User.find_by(id: user_id)
      if user
        # && session[:session_token] == user.session_token
        @current_user = user
      end
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    @current_user ||= User.find(id: seesion[:user_id])
  end
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  #Forgets a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token )
  end

  # Log out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def session_token
    remember_digest || remember
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
