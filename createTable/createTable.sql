-- Creating tables --

/**create table table_name(
	column_name datatype optional constraint,
    column_name datatype optional constraint,
    column_name datatype optional constraint,
    .......
    constraint constraint_name constraint_type(column_name)
);**/


/**create table Human(
	`humanId`  int(10)  Not Null,
    `name` varChar(30)  Not Null,
    `age`  int(3)  Not Null,
    `gender` varChar(1)  Not Null,
    bloodType varChar(3) Not Null,
    GenoType varChar(3)  Not Null,
   -- define the primary key column-- 
    constraint human_PK Primary key(humanId)
);**/


/**create table Games(
	`gameId`  int(3)  Not Null,
    `Gamename` varChar(30)  Not Null,
    `price`  numeric(4,2)  Not Null,
    `quantity` int(3)  Not Null,
    Location varChar(25) Not Null,
   -- define the primary key column-- 
    constraint Games_PK Primary key(gameId)
);**/

create table GamePurchase(
	`humanId`  int(10)  Not Null,
    `gameId` int(3)  Not Null,
     -- Surrogate column-- 
    `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    constraint order_PK Primary key(humanId, gameId),
	constraint human_fk foreign key(humanId)
						references Human(humanId),
	constraint games_fk foreign Key(gameId)
						references Games(gameId)
);