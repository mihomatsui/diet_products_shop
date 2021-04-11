class Dietshop
  attr_reader :products
  #ダイエットショップの開店と同時に商品インスタンスを生成
  def initialize(product_params)
    @products = []
    register_product(product_params)
  end

  def register_product(product_params)
    product_params.each do |param|
      @products << Product.new(param)
    end
  end

  # 商品を表示
  def disp_products
    puts "いらっしゃいませ！商品を選んで下さい。"
    @products.each do |product,i| 
      puts "#{product.id}.#{product.name}(#{product.price}円)"
    end
  end

  def ask_quantity(chosen_product)
    puts "#{chosen_product.name}ですね。何個買いますか？"
  end

  def calculate_charges(user)
    total_price =  user.chosen_product.price * user.quantity_of_product
    if total_price < 3000
      # 3000円未満の場合送料500円がかかる
    total_price += 500
    puts "お買い上げ金額が3000円未満のため、送料500円を別途頂きます。"
    end
    puts "合計金額は#{total_price}円です。"
    puts "お買い上げありがとうございました！"

  end
end