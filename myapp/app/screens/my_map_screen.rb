class MyMapScreen < PM::MapScreen
  title "My Map"
  start_position latitude: 25.0339031, longitude: 121.5645098, radius: 1
  tap_to_add length: 1.5, annotation: {animates_drop: true, title: "New pin"}

  def annotation_data
    [{
      longitude: 121.5645098,
      latitude: 25.0339031,
      title: "Taipei 101",
      subtitle: "Not the tallest building in the world",
      action: :show_alert
    }]
  end

  def show_alert
    App.alert("Here!")

  end
end