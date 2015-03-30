class AppDelegate < PM::Delegate
  def on_load(app, options)

    MotionRecord::Schema.up! do
      migration 1, "Create contact table" do
        create_table :contacts do |t|
          t.text :name, null: false
          t.text :tel
          t.text :address
          t.timestamps
        end
      end
    end

    if App::Persistence['setup'].nil?
      contacts = [
        ["Alen", "0912345678", "Taipei"],
        ["Bob", "0912345678", "Taipei"],
        ["Chris", "0912345678", "Taipei"],
        ["Richie", "0912345678", "Taipei"],
        ["Oliver", "0912345678", "Taipei"],
        ["Zamy", "0912345678", "Taipei"]
      ]

      contacts.each do |contact|
        row = Contact.new(name: contact[0], tel: contact[1], address: contact[2])
        row.save
      end

      App::Persistence['setup'] = true
    end

    mp App::Persistence['about']
    App::Persistence['about']||=[false]
    open_menu HomeScreen.new(nav_bar: true), left: NavigationScreen, to_show: :all

  end
end