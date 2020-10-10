create database truyum;
use truyum;
create table menu_items(
	menu_id int not null,
    name  varchar(20),
    price decimal(10,2),
    active enum('Yes','No'),
    date_of_launch date,
    category varchar(20),
    free_delivery enum('Yes','No'),
    constraint pk_menuitems_menu_id primary key (menu_id)
    );
    create table users(
    user_id int not null,
    user_name varchar(20),
    constraint pk_users_user_id primary key (user_id)
    );
    create table carts(
    cart_id int not null,
    cart_user_id int, 
    cart_menu_id int,
    constraint pk_carts_cart_id primary key (cart_id),
    constraint fk_carts_user_id foreign key (cart_user_id) references users(user_id),
    constraint fk_carts_menu_id foreign key (cart_menu_id) references menu_items(menu_id)
    );


    