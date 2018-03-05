require('rspec')
require('spec_helper')
require('pry')
require('pg')

describe(Store) do
  it { should have_many(:brands).through(:brands_stores) }
  it("converts the name to lowercase") do
    store = Store.create({:name => "finagle"})
    expect(store.name()).to(eq("Finagle"))
  end
  it("validates presence of name") do
     store = Store.new({:name => ""})
     expect(store.save()).to(eq(false))
   end
end
