
require "minitest/autorun"
require 'minitest/spec'
require 'mongo'
require 'bson'

class Specs < MiniTest::Spec
	before do
		db = Mongo::Connection.new.db("dogs")
		@dogs = db.collection('dogs')  
	end

	after do
		@dogs.remove
	end


	describe "Lets write and return things from the database" do
		it "returns the data we expect from the database" do
			fido = {
			name: "Fido",
			species: "cocker spaniel",
			gender: "male"
			}
			test_dog = {"name"=>"Fido"}
			fido_id = @dogs.insert(fido)
			#this test will fail if a new dog is entered with a name that comes before Fido
			#where the Fi remains the same, such as Fickle.
			puts @dogs.find({"name" => /Fi/}).first
			our_dog = @dogs.find({"name" => /Fi/}).first.to_hash
			test_dogName = test_dog["name"]
			our_dogName = our_dog["name"]
			assert test_dogName == our_dogName
		end	
	end
end