create table tbl_board(
	bid int not null auto_increment,
	subject varchar(200) not null,
	content text null, 
	writer varchar(50) not null,
	regdate timestamp not null default now(),
	hit int default 0,
	primary key(bid)
)