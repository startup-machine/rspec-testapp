require 'rails_helper' 
describe User do 
  it "is valid when it contains first name, last name and email" do
    user = User.new( firstname: 'John', 
      lastname: 'D', 
      email: 'john@gmail.com' )

      expect(user).to be_valid
  end
  it "not valid when first name is null" do
    user = User.new( firstname: nil)
    user.valid?

    expect(user.errors[:firstname]).to include("can't be blank") 
  end
  it "is valid if an email already exists" do 
    user = User.create( firstname: 'Steve', 
     lastname: 'Harris', email: 'steve@gmail.com' ) 
    user = User.new( firstname: 'Bruce', 
     lastname: 'Dickinson', email: 'steve@gmail.com' ) 
    user.valid? 
    expect(user.errors[:email]).to include('has already been taken')
  end 
end