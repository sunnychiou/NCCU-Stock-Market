create table MyGroup (
    group_id int not null,
    group_name nvarchar(40) not null,
    primary key (group_id)
);

create table Company (
    company_id int not null,
    company_name nvarchar(40) not null,
    cgroup_id int not null,
    primary key (company_id),
    foreign key (cgroup_id) references MyGroup(group_id)
);

create table Stock (
    stock_id int not null,
    scompany_id int not null,
    price int not null,
    num int not null,
    primary key (stock_id),
    foreign key (scompany_id) references Company(company_id)
);

create table User (
    user_id int auto_increment,
    user_name varchar(40) not null,
    password varchar(40) not null,
    money int not null,
    primary KEY (user_id)
);

create table BuyOrder (
    order_id int not null auto_increment,
    stock_id int not null,
    num int not null,
    price int not null,
    time datetime not null,
    buser_id int not null,
    primary key (order_id),
    foreign key (buser_id) references User(user_id)
);

create table SellOrder (
    order_id int not null auto_increment,
    stock_id int not null,
    num int not null,
    price int not null,
    time datetime not null,
    suser_id int not null,
    primary key (order_id),
    foreign key (suser_id) references User(user_id)
);

create table MyTransaction (
    transaction_id varchar(40) not null,
    tbuy_order_id int not null,
    tsell_order_id int not null,
    finish_time datetime not null,
    tstock_id int not null,
    num int not null,
    price int not null,
    primary key (transaction_id),
    foreign key (tbuy_order_id) references BuyOrder(order_id),
    foreign key (tsell_order_id) references SellOrder(order_id),
    foreign key (tstock_id) references Stock(stock_id)
);

create table Own (
    Ouser_id int not null,
    Ostock_id int not null,
    num int not null,
    primary key (Ouser_id, Ostock_id),
    foreign key (Ouser_id) references User(user_id),
    foreign key (Ostock_id) references Stock(stock_id)
);