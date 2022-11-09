create database laravel_8 ;
use laravel_8;
create table category
(
id int PRIMARY key auto_increment,
name varchar(255) NOT NULL unique,
status tinyint(1) default '1' comment '1 là hiển thị,0 là ẩn',
prioty tinyint(1) default '0',
created_at date default current_timestamp(),
updated_at date default current_timestamp(),
deleted_at date default current_timestamp()
) engine=InnoDB;

create table banner
(
id int PRIMARY key auto_increment,
name varchar(255) NOT NULL,
image varchar(255) NOT NULL,
link varchar(255)default '#',
description varchar(255) ,
status tinyint(1) default '1' comment '1 là hiển thị,0 là ẩn',
prioty tinyint(1) default '0',
created_at date default current_timestamp(),
updated_at date default current_timestamp(),
deleted_at date default current_timestamp()
) engine=InnoDB;

create table product
(
id int PRIMARY key auto_increment,
name varchar(255) NOT NULL,
image varchar(255) NOT NULL,
image_list text,
price float(9,3) NOT NULL,
sale_price float(9,3) default '0',
description text ,
status tinyint(1) default '1' comment '1 là hiển thị,0 là ẩn',
category_id int NOT NULL ,
created_at date default current_timestamp(),
updated_at date default current_timestamp(),
deleted_at date default current_timestamp(),
FOREIGN KEY (category_id) 
  REFERENCES category(id)
) engine=InnoDB;

create table account
(
id int PRIMARY key auto_increment,
name varchar(100) NOT NULL ,
email varchar(100) NOT NULL unique,
phone varchar(100) NOT NULL unique,
password varchar(100) NOT NULL ,
address varchar(255) null,
role varchar(50) default 'customer',
status tinyint(1) default '1' comment '1 là hoạt động,0 là bị khoá',
created_at date default current_timestamp(),
updated_at date default current_timestamp(),
deleted_at date default current_timestamp()
) engine=InnoDB;

create table blog
(
id int PRIMARY key auto_increment,
name varchar(255) NOT NULL,
image varchar(255) NOT NULL,
sumary varchar(255) ,
description text ,
status tinyint(1) default '1' comment '1 là hiển thị,0 là ẩn',
account_id int NOT NULL,
created_at date default current_timestamp(),
updated_at date default current_timestamp(),
deleted_at date default current_timestamp(),
FOREIGN KEY (account_id) 
  REFERENCES account(id)
) engine=InnoDB;


create table oder
(
id int PRIMARY key auto_increment,
name varchar(100)  NULL ,
email varchar(100)  NULL ,
phone varchar(100)  NULL ,
address varchar(255) null,
note text ,
status tinyint(1) default '1' comment '1 là hiển thị,0 là ẩn',
account_id int NOT NULL,
created_at date default current_timestamp(),
updated_at date default current_timestamp(),
deleted_at date default current_timestamp(),
FOREIGN KEY (account_id) REFERENCES account(id)
) engine=InnoDB;

create table oder_detail
(
order_id int NOT NULL,
product_id int NOT NULL,
quantity int NOT NULL,
price float NOT NULL,
FOREIGN KEY (order_id) REFERENCES oder(id),
FOREIGN KEY (product_id) REFERENCES product(id)
) engine=InnoDB;
