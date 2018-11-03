class Api::V1::Users::FavoritesController < ActionController::API

  def create
    user = User.find(params[:user_id])
    favorite = user.favorites.create(fave_params)
    if favorite.save
      render json: {message: "Favorite created"}
    else
      render json: {message: 'Unable to create favorite'}, status: 400
    end
  end

  private

  def fave_params
    params.require(:favorite).permit(:title, :source, :url)
  end

end
