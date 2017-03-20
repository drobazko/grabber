require 'open-uri'
require 'nokogiri'
require 'httparty'

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    begin
      product_parser = ProductParser.new(params[:product_url])
      @product = Product.create!(product_parser.parse)
      @product.reviews.create!(ReviewParser.new(product_parser.product_id).parse)
      redirect_to product_path(@product)
    rescue Exception => e
      redirect_to new_product_path, notice: e.message
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
