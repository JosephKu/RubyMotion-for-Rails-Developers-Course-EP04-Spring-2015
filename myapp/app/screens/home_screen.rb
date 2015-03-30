class HomeScreen < PM::TableScreen
  title 'myapp'
  searchable placeholder: "Search..."

  def on_load
    set_nav_bar_button :right, title: "About", action: :show_about
    set_nav_bar_button :left, title: "Menu", action: :show_menu
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }

  end

  def table_data
    [{
      cells: Contact.find_all.map do |contact|
        {
          title: contact.name,
          action: :edit_contact,
          arguments: { contact: contact }
        }
      end
    }]

  end

  def show_about
    open AboutScreen.new(nav_bar: true)

  end

  def show_menu
    app_delegate.menu.show(:left)

  end

  def edit_contact(args={})
    open_modal EditContactScreen.new(args), nav_bar: true
  end

end