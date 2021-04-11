require "./product.rb"
require "./dietshop.rb"
require "./user.rb"

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