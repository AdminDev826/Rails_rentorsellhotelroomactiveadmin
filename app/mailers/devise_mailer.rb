class DeviseMailer < Devise::Mailer

  def confirmation_instructions(record, token, opts={})
    custom_options(opts)
    super
  end

  def reset_password_instructions(record, token, opts={})
    pass_reset_options(opts)
    super
  end

  def unlock_instructions(record, token, opts={})
    custom_options(opts)
    super
  end

  private

  def custom_options(opts)
    opts[:from] = 'Araddi.com'
    opts[:subject] = 'Welcome to Araddi! Please confirm your email'
    attachments.inline['logo2.jpg'] = File.read("app/assets/images/images/logo2.jpg")
  end
  
  def pass_reset_options(opts)
    opts[:from] = 'Araddi.com'
    opts[:subject] = 'Your Araddi.com password has been reset'
  end
end
