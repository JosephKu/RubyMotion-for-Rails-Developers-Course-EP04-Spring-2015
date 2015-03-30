class FormScreen < PM::FormScreen
  attr_accessor :contact

  def form_data
    [{
      title: "Account Information",
      footer: "Some help text",
      cells: [{
        name: "tel",
        title: "TEL",
        value: self.contact.tel
      }, {
        name: "address",
        title: "Address",
        value: self.contact.address
      }]
    }]
  end

end