module ControllerMacros
  def log_in(user)
    # mock up an authentication in the underlying warden library
    request.env['warden'] = mock(Warden, :authenticate => user,
                                         :authenticate! => user,
                                         :user => user)
  end
end