
module AuthlogicSystem
  protected

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user ||= current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      add_warning ("You must be logged in to access this page" )
      flash.keep
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      add_warning ( "You must be logged out to access this page" )
      flash.keep
      redirect_to root_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def require_admin
   return true if current_user.admin?
   
   store_location
   add_warning ( "You must be an administrator to access this page" )
   flash.keep
   redirect_to root_url
   false
  end

  def access_denied
    store_location
    add_warning ("You do not have access to this page")
    flash.keep
    redirect_to login_path
  end

  def logged_in?()
   current_user_session != nil
  end

  def admin?()
   logged_in? && (current_user.admin == true)
  end

  def can_edit?(current_item)
   return false unless logged_in?
   if request.path_parameters['controller'] == "users"
     return current_user.admin? || (current_user == current_item)
   else
     return current_user.admin? || (current_user.id == current_item.user_id)
   end
  end

  def can_edit
   redirect_to root_path and return false unless logged_in?
   klass = request.path_parameters['controller'].camelize.singularize.constantize
   @item = klass.find(params[:id])
   if request.path_parameters['controller'] == "users"
     redirect_to root_path and return false unless admin? || (current_user == @item)
   else
     redirect_to root_path and return false unless admin? || (current_user == @item.user)
   end
  end

end