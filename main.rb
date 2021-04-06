# 商品データ
products = [
  {name: "ダイエット青汁", price: 1000},
  {name: "酵素サプリ", price: 2000},
  {name: "サウナスーツ", price: 3000},
  {name: "骨盤ベルト", price: 3500},
]

# 商品を表示
puts "いらっしゃいませ！商品を選んで下さい。"
products.each.with_index(1) do |product,i| 
  puts "#{i}.#{product[:name]}(#{product[:price]}円)"
end

print "商品の番号を選択 > "
# 整数化したいので.to_iをつける
select_product_num = gets.to_i
# 選んだ商品
chosen_product = products[select_product_num -1]

puts "#{chosen_product[:name]}ですね。何個買いますか？"
print "個数を入力 >"
quantity_of_product = gets.to_i

# 合計金額 = 選んだ商品の金額 * 個数 + 送料
total_price =  chosen_product[:price] * quantity_of_product

if total_price < 3000
  # 3000円未満の場合送料500円がかかる
 total_price += 500
 puts "お買い上げ金額が3000円未満のため、送料500円を別途頂きます。"
end
puts "合計金額は#{total_price}円です。"
puts "お買い上げありがとうございました！"