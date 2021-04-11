class Product
 attr_reader :id, :name, :price
 @@count = 30
 def initialize(product_params)
    @id = @@count += 1
    @name = product_params[:name]
    @price = product_params[:price]
 end
end

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

class User
  # 商品を選択
  attr_reader :chosen_product, :quantity_of_product
  def choose_product(products)
    while true
      print "商品の番号を選択 > "
      # 整数化したいので.to_iをつける
      select_product_id = gets.to_i
      @chosen_product = products.find{|product| product.id == select_product_id}
      # 入力値の確認
      break if !@chosen_product.nil?
      puts "#{products.first.id}から#{products.last.id}の番号から選んで下さい。"
    end
  end

  # 商品の個数を決定
  def decide_quantity
    while true
      print "個数を入力 >"
      @quantity_of_product = gets.to_i
      break if @quantity_of_product >= 1
      puts "1個以上選んで下さい。"
    end
  end
end

# ダイエットショップ１の商品データ
product_params1 = [
  {name: "ダイエット青汁", price: 1000},
  {name: "酵素サプリ", price: 2000},
  {name: "サウナスーツ", price: 3000},
  {name: "骨盤ベルト", price: 3500},
]
# product_params1 の商品を持つ八百屋の開店
dietshop1 = Dietshop.new(product_params1)

# 追加商品データadding_product_params1を定義
adding_product_params1 = [
  {name: "着圧タイツ", price: 800},
  {name: "ダイエットスリッパ", price: 500}
]

# 商品を登録
dietshop1.register_product(adding_product_params1)

# お客さんの来店
user = User.new

# 商品を表示
dietshop1.disp_products
# 商品を選択
user.choose_product(dietshop1.products)
# 個数を質問
dietshop1.ask_quantity(user.chosen_product)
# 個数を決定
user.decide_quantity
# 合計金額を計算
dietshop1.calculate_charges(user)