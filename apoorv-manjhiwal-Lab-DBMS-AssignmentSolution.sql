insert into supplier values(1, 'rajesh retails', 'delhi', '1234567890');
insert into supplier values(2, 'appario ltd', 'mumbai', '2589631470');
insert into supplier values(3, 'knome products', 'bangalore', '9785462315');
insert into supplier values(4, 'bansai retails', 'kochi', '8975463285');
insert into supplier values(5, 'mittal ltd', 'lucknow', '7898456532');

insert into customer values(1, 'aakash', '9999999999', 'delhi', 'm');
insert into customer values(2, 'aman', '9785463215', 'noida', 'm');
insert into customer values(3, 'neha', '9999999999', 'mumbai', 'f');
insert into customer values(4, 'megha', '9994562399', 'kolkata', 'f');
insert into customer values(5, 'pulkit', '8959999999', 'lucknow', 'm');

insert into category values(1, 'books');
insert into category values(2, 'games');
insert into category values(3, 'groceries');
insert into category values(4, 'electronics');
insert into category values(5, 'clothes');

insert into product values(1, 'gta5', 'lakshflnashfaxu', '2');
insert into product values(2, 'tshirt', 'lfgaebgfal', '5');
insert into product values(3, 'ROG laptop', 'JFHCSLJFHCNLKDHF', '4');
insert into product values(4, 'OATS' 'faclnfhx', '3');

insert into product_details values(1, 1, 2, 1500);
insert into product_details values(2,3,5,30000);
insert into product_details values(3,5,1,3000);
insert into product_details values(4,2,3,2500);
insert into product_details values(5,4,1,1000);

insert into `order` values(20, 1500, "2021-10-12", 3, 5);
insert into `order` values(25, 30500, "2021-09-16", 5, 2);
insert into `order` values(26, 2000, "2021-10-5", 1, 1);
insert into `order` values(30, 3500, "2021-08-16", 4, 3);
insert into `order` values(50, 2000, "2021-10-06", 2, 1);

insert into `rating` values(1, 2, 2, 4);
insert into `rating` values(2, 3, 4, 3);
insert into `rating` values(3, 5, 1, 5);
insert into `rating` values(4, 1, 3, 2);
insert into `rating` values(5, 4, 5, 4);

select cust.cus_gender, count(cus_gender) as count from customer cust inner join
`order` on cust.cus_id = `order`.cus_id where `order`.ord_amount>= 3000 group by cust.cus_gender
select `order`.*, product.pro_name from `order`, product_details, 
product where `order`.cus_id = 2 and `order`.prod_id = product_details.prod_id and product.prod_id = product.pro_id

select supplier.* from supplier, product_details where supplier.supp_id in( select product_details.supp_id from product_details
 group by product_details.supp_id having count(product_details.supp_id) >1)group by supplier.supp_id
 
 select category.* from `order` inner join product_details on
 `order`.prod_id = product_details.prod_id
 inner join product on product.pro_id = product_details.pro_id
 inner join category on category.cat_id = product.cat_id 
 order by `order`.ORD_AMOUNT limit 1
 
 select product.pro_id, product.pro_name from `order` inner join product_details on `order`.prod_id = product_details.prod_id 
 inner join product on product.pro_id = product_details.prod_id
 where `order`.ord_date > '2021-10-05';
 
 select cust.cus_name, cust.cus_gender from customer cust where cust.CUS_NAME like 'A%' or cust.CUS_NAME like '%A'  
 
 select supplier.supp_id, supplier.supp_name, rating.rat_ratstars, 
 case 
 when rating.rat_ratstars > 4 then 'geniune supplier' 
  when rating.rat_ratstars > 2 then 'average supplier'
  else ' supplier should not be considered'
  end as verdict from rating inner join supplier on supplier.supp_id = rating.supp_id;
  call new_procedure()