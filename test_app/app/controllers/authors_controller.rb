class AuthorsController < ApplicationController

	attr_accessor :authors

	def initialize
		@authors = [{name:'Philip K. Dick', death:'2005'}, {name:'Thomas Berger', death:'-'}, {name:'T. S. Stribling', death:'1976'}]
	end

	def index
		render :json => @authors.to_json
	end

end