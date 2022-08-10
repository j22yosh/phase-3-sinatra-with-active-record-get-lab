class ApplicationController < Sinatra::Base
  set :default_content_type, :json

  # add routes
  get '/bakeries' do
   # get all the bakeries from the database
   bakeries = Bakery.all
   # send them back as a JSON array
   bakeries.to_json
  end

  get '/bakeries/:id' do
  bakery = Bakery.find(params[:id])
  bakery.to_json(include: :baked_good)
  end

  get '/baked_goods/by_price' do
    bg = BakedGood.order('price DESC')
    bg.to_json
  end
  get '/baked_goods/most_expensive' do
    bg = BakedGood.order('price DESC').limit(1)
    bg.to_json(only: [:name, :price])
  end


end
