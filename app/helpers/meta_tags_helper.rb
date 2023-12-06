module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])

    # Vérifier si meta_image n'est pas nil avant d'appeler starts_with?
    if meta_image.present?
      meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
    else
      # Retourner une valeur par défaut ou gérer le cas où meta_image est nil
      DEFAULT_META["default_image"]
    end
  end
end
