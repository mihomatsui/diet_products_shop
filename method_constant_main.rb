# メソッドを定義する部分 ------------------------

# 商品を表示
def disp_products(products)
  puts "いらっしゃいませ！商品を選んで下さい。"
  products.each.with_index(FIRST_PRODUCT_NUM) do |product,i| 
    puts "#{i}.#{product[:name]}(#{product[:price]}円)"
  end
end

# 商品を選択
def choose_product(products)
  while true
    print "商品の番号を選択 > "
    # 整数化したいので.to_iをつける
    select_product_num = gets.to_i
    # 入力値に商品の番号が含まれるかどうかの確認
    break if (FIRST_PRODUCT_NUM..LAST_PRODUCT_NUM).include?(select_product_num)
    puts "#{FIRST_PRODUCT_NUM}~#{LAST_PRODUCT_NUM}の番号を入力して下さい。"
  end
  # 選んだ商品
  chosen_product_index = select_product_num - FIRST_PRODUCT_NUM
  products[chosen_product_index]
end

# 商品の個数を決定
def decide_quantity(chosen_product)
  puts "#{chosen_product[:name]}ですね。何個買いますか？"
  while true
    print "個数を入力 >"
    quantity_of_product = gets.to_i
    break if quantity_of_product >= 1
    puts "1個以上選んで下さい。"
  end
  quantity_of_product
end

# 合計金額を計算
def calculate_charges(chosen_product, quantity_of_product)
  total_price =  chosen_product[:price] * quantity_of_product

  if total_price < SHIPPING_FREE_STANDARD_PRICE
    # 3000円未満の場合送料500円がかかる
  total_price += SHIPPING_PRICE
  puts "お買い上げ金額が#{SHIPPING_FREE_STANDARD_PRICE}円未満のため、送料#{SHIPPING_PRICE}円を別途頂きます。"
  end
  puts "合計金額は#{total_price}円です。"
  puts "お買い上げありがとうございました！"
end

# メソッドを呼び出す部分 ------------------------

# 商品データ
products = [
  {name: "ダイエット青汁", price: 1000},
  {name: "酵素サプリ", price: 2000},
  {name: "サウナスーツ", price: 3000},
  {name: "骨盤ベルト", price: 3500},
]

# 定数を設定。ここでのコードが全体に表示される
FIRST_PRODUCT_NUM = 31 #表示する最初の番号(変更可)
LAST_PRODUCT_NUM = (FIRST_PRODUCT_NUM + products.size) - 1 #表示する最後の商品の番号(変更不可)
SHIPPING_FREE_STANDARD_PRICE = 3000 # 割引を適用する個数の基準値(変更可)
SHIPPING_PRICE = 500 # 送料の価格(変更可)

disp_products(products) # 商品を表示
chosen_product = choose_product(products) # 商品を選択
quantity_of_product = decide_quantity(chosen_product) # 商品の個数を決定
calculate_charges(chosen_product, quantity_of_product) # 合計金額を計算