class Admin < Ohm::Model
  include Shield::Model

  attribute :email
  attribute :crypted_password
  attribute :first_name
  attribute :last_name

  reference :building, :Building

  unique :email

  def self.fetch(email)
    with(:email, email)
  end
end
