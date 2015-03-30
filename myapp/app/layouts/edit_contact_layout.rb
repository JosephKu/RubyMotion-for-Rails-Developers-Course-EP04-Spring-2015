class EditContactLayout < MK::Layout
  view :form_view

  def layout
    root :main do
      add UIImageView, :profile_image
      add form_view, :form
    end

  end

  def main_style
    background_color "#EECA04".uicolor

  end

  def profile_image_style
    image "default_avatar".uiimage
    clips_to_bounds true

    layer do
      corner_radius 50.0
    end

    constraints do
      top 90
      left 140
      width 100
      height 100
    end

  end

  def form_style
    top 300
    left 0
    right "100%"

  end

end