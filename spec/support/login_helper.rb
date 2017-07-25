module LoginHelper
  def login_provider
    health_provider = HealthProvider.create!(
      email: "bello@health.net",
      password: "123456",
      facility_name: "Bello Health",
      address: "2308 nw 66th dr"
    )
    visit root_path
    fill_in 'Email', with: health_provider.email
    fill_in 'Password', with: '123456'
    click_button 'Submit'

    health_provider
  end

  def login_donor
  end

end
