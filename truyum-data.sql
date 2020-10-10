/*Frame insert scripts to add data into menu_item table. Refer View Menu
Item List Admin screen below for sample data.*/

insert into menu_items(menu_id,name,price,active,date_of_launch,category,free_delivery)
values (1,'Sandwich','99.00','Yes','2017/03/15','Main Course','Yes'),
		(2,'Burger','129.00','Yes','2017/12/23','Main Course','No'),
        (3,'Pizza','149.00','Yes','2017/08/21','Main Course','No'),
		(4,'French Fries','57.00','No','2017/07/02','Starters','Yes'),
        (5,'Chocolate Brownie','32.00','Yes','2017/03/15','Desserts','Yes');
        
/*Frame SQL query to get all menu items*/  
      
select * from menu_items;

/*Frame SQL query to get all menu items which after launch date and is active*/

select * from menu_items 
where date_of_launch < current_date() and active = 'Yes';

/*Frame SQL query to get a menu items based on Menu Item Id*/

select * from menu_items where menu_id = 1;

/*Frame update SQL menu_items table to update all the columns values
based on Menu Item Id*/

update menu_items 
set name = 'veg sandwich',
price = '100.00',
active = 'Yes',
date_of_launch = '2018/09/22',
category = 'Main Course',
free_delivery = 'Yes'
where menu_id = 1;

/*Frame insert scripts for adding data into user and cart tables.In user table
create two users. Once user will not have any entries in cart, while the
other will have at least 3 items in the cart*/


insert into  users(user_id,user_name) values (1,'John'),(2,'Mary');
insert into carts(cart_id,cart_user_id,cart_menu_id) values (1,1,null),(2,2,1),(3,2,2),(4,2,3);

/*Frame SQL query to get all menu items in a particular user’s cart*/

select m.menu_id,m.name,m.price,m.date_of_launch,m.category,m.free_delivery from menu_items as m 
inner join carts as  c on m.menu_id = c.cart_menu_id 
inner join users as u on c.cart_user_id = u.user_id
where u.user_id = 2;

/*Frame SQL query to get the total price of all menu items in a particular
user’s cart*/

select u.user_name,sum(price) as Total_Price from menu_items m 
inner join carts as  c on m.menu_id = c.cart_menu_id 
inner join users as u on c.cart_user_id = u.user_id
where u.user_id = 2;

/*Frame SQL query to remove a menu items from Cart based on User Id
and Menu Item Id*/

delete from carts where cart_user_id = 2 and cart_menu_id = 1;

        