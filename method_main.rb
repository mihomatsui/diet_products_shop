# メソッドを定義する部分 ------------------------

# 商品を表示
def disp_products(products)
  puts "いらっしゃいませ！商品を選んで下さい。"
  products.each.with_index(1) do |product,i| 
    puts "#{i}.#{product[:name]}(#{product[:price]}円)"
  end
end

# 商品を選択
def choose_product(products)
  while true
    print "商品の番号を選択 > "
    # 整数化したいので.to_iをつける
    select_product_num = gets.to_i
    # 入力値に1から4が含まれるかどうかの確認
    break if (1..4).include?(select_product_num)
    puts "1~4の番号を入力して下さい。"
  end
  # 選んだ商品
  products[select_product_num -1]
end

# 商品の個数を決定
def decide_quantity
  puts "#{chosen_product[:name]}ですね。何個買いますか？"
  while true
    print "個数を入力 >"
    quantity_of_product = gets.to_i
    break if quantity_of_product >= 1
    puts "1個以上選んで下さい。"
  end
end

# 合計金額を計算
def calculate_charges
  total_price =  chosen_product[:price] * quantity_of_product

  if total_price < 3000
    # 3000円未満の場合送料500円がかかる
  total_price += 500
  puts "お買い上げ金額が3000円未満のため、送料500円を別途頂きます。"
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

disp_products(products) # 商品を表示
chosen_product = choose_product(products) # 商品を選択
decide_quantity # 商品の個数を決定
calculate_charges # 合計金額を計算