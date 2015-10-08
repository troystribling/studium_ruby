require 'sinatra'
require "sinatra/activerecord"

get '/hey' do
	'Hey'
end

get '/hey/:name' do |name|
	if last = params[:last]
		"Hey #{name} #{last}"
	else
		"Hey #{name}"
	end
end

get '/hey/*/*' do |first, last|
	puts params
	"Hey #{first} #{last}"
end


class Author < ActiveRecord::Base
	has_many :books, :dependent => :destroy
end


class Book < ActiveRecord::Base
	belongs_to :author
end

