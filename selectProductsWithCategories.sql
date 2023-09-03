SELECT p.name as 'Продукт' , c.name as 'Категория'
FROM Products_With_Categories pc
RIGHT JOIN Products p ON p.id_product = pc.id_product
LEFT JOIN Categories c ON c.id_category = pc.id_category