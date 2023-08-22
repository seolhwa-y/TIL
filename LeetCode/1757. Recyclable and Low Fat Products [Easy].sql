/* Recyclable and Low Fat Products
 * Products 테이블의 저지방이면서, 재활용이 가능한 제품
 * 상품ID
 */

 SELECT product_id
 FROM   Products
 WHERE  low_fats = 'Y' AND recyclable = 'Y'