require('rspec')
require('spec_helper')
require('pry')
require('pg')

describe(Brand) do
  it { should have_many(:stores).through(:brands_stores) }
  it("converts the name to lowercase") do
    brand = Brand.create({:name => "finagle"})
    expect(brand.name()).to(eq("Finagle"))
  end
  it("validates presence of name") do
     brand = Brand.new({:name => ""})
     expect(brand.save()).to(eq(false))
   end
end
