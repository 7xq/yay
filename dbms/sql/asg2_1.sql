select Name from client_master where Name like '_a%';

select Name,City from client_master where City NOT like 'B%';

select Name,City from client_master where Name like 'I%'  AND LENGTH(Name)=12;

select Name,City from client_master where City in ('Bombay','Delhi');

select * from client_master where Balance_due>10000;

select * from sales_order where To_char(Order_date,'Mon') like 'Jan';

select * from sales_order where Client_no in ('C001','C002');

select * from product_master where sell_price >2000 AND sell_price <5000;

select Description,Sell_price,1.15*sell_price AS New_price  from product_master where sell_price >1500 ;

select Name,City,State from client_master where State != 'Maharastra';

select To_char(Delivery_date, 'Mon') AS Month,To_char(Delivery_date,'DD') AS day from sales_order;

select To_char(Order_date,'DD-Month-YY') AS Date_of_Order from sales_order;

select sysdate+15 from dual;