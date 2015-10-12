class BooksController < ApplicationController

		@@books = [['Andoids', 'Impostor'], ['Little Big Man', 'Aurthor Rex'], ['The Hill', 'The Vallye']]

		def index
			author_id = params['author_id'].to_i
			render :json => @@books[author_id].to_json
		end

		def show
			author_id = params['author_id'].to_i
			book_id = params['id'].to_i
			render :json => @@books[author_id][book_id].to_json
		end

end