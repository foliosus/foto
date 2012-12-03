# Foto

A gem for communicating with the FOTO Patient Inquiry API http://share.patient-inquiry.com.

## Installation

Add this line to your application's Gemfile:

    gem 'foto'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install foto

## Usage

Configure the gem:
```ruby
Foto.configure do |config|
  config.api_key = '41B4333G-FF2E-41B9-2M24-2G31381D237T'
  config.base_uri = 'http://devs.patient-inquiry.com'
end
```

Update or create a patient:
```ruby
patient = Foto::Patient.new({
      :first_name    => patient.first_name,
      :last_name     => patient.last_name,
      :date_of_birth => patient.birth_date,
      :email         => patient.email,
      :gender        => patient.gender,
      :language      => 'en',
      :external_id   => patient.id
    })
patient.save
```

You can also specify an api key per request:
```ruby
patient = Foto::Patient.new({
      :api_key       => '41B4333G-FF2E-41B9-2M24-2G31381D237T',
      :first_name    => patient.first_name,
      :last_name     => patient.last_name,
      ...
    })
patient.save
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
