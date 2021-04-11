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