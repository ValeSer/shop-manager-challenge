class OrderRepository
  require_relative 'order'

  def all
    orders = []
    sql = 'SELECT id, date, customer_name, item_id FROM orders;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      order = Order.new
      order.id = record['id'].to_i
      order.date = record['date']
      order.customer_name = record['customer_name']
      order.item_id = record['item_id'].to_i
      orders << order
    end 
    return orders
  end

end
