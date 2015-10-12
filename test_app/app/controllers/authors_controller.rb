class AuthorsController < ApplicationController

	@@authors = [{name:'Philip K. Dick', death:'2005'}, {name:'Thomas Berger', death:'-'}, {name:'T. S. Stribling', death:'1976'}]

	attr_accessor :authors

	def initialize
	end

	def index
		render :json => @@authors.to_json
	end

	def show
		render :json => @@authors[params['id'].to_i].to_json
	end

end