module GamesHelper
	def chess_piece(x,y)
		piece = @pieces.where(x_position: x, y_position: y).first
		return if piece.nil?
		image_tag piece.image_name
	end
end
