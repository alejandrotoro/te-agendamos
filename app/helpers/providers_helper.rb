module ProvidersHelper
  def provider_resource_name
    :provider
  end

  def provider_resource
    @resource = session[:subscription] || Provider.new
  end

  def provider_devise_mapping
    @devise_mapping ||= Devise.mappings[:provider]
  end

  def provider_devise_error_messages!
    return "" if provider_resource.errors.empty?

    messages = provider_resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => provider_resource.errors.count,
                      :resource => provider_resource_name)

    html = <<-HTML
<div id="error_explanation">
<h2>#{sentence}</h2>
<ul>#{messages}</ul>
</div>
HTML

    html.html_safe
  end
end
