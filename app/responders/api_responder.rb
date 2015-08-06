class ApiResponder < ActionController::Responder
  def api_location
    options[:location]
  end
end
