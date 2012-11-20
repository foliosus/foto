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


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
