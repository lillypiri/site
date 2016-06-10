module EmailHelper

  def email (email)
    parts = email.split("@")

    return "<span class='secret-email' data-email='#{parts.join("|")}'></span>".html_safe
  end
end
