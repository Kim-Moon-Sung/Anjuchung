create table reviews(
    reviewNo bigint not null auto_increment,
    reviewTitle varchar(200),
    reviewContent varchar(200),
    reviewWriterId varchar(64),
    postDate date,
    visitCount int(6),
    primary key (reviewNo)
);