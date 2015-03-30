class NavigationScreen < PM::TableScreen
  def table_data
    [
      title: nil,
      cells: [{},{
        title: 'Profile',
        action: :swap_center_controller,
        arguments: HomeScreen
      }]
    ]
  end

  def swap_center_controller(screen_class)
    app_delegate.menu.hide
  end
end