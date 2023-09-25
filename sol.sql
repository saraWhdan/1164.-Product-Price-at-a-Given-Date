with cte_product (product_id,ch) as (SELECT product_id , MAX(change_date) 
FROM products
WHERE change_date <= '2019-8-16'
GROUP BY product_id)

SELECT p.product_id,MAX(CASE when p.change_date=t.ch then p.new_price
                              when t.product_id is null then 10
                              end ) AS price
FROM products p
LEFT JOIN 
   cte_product  t ON p.product_id = t.product_id
   group by p.product_id
