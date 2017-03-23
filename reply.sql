create table reply (
	rebid int not null auto_increment,
    bid int not null default 0,
    replyContent varchar(1000) not null,
    replyer varchar(50) not null,
    regdate timestamp not null default now(),
    updateDate timestamp not null default now(),
    primary key(rebid)
);

alter table reply add constraint fk_bid
foreign key(bid) references tbl_board(bid);