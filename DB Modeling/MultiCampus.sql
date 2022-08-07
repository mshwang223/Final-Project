CREATE TABLE `user` (
	`userId`	VARCHAR(50)	NOT NULL,
	`userPw`	VARCHAR(50)	NOT NULL,
	`userEmail`	VARCHAR(50)	NOT NULL,
	`userImg`	TEXT	NULL,
	`activeDate`	DATE	NOT NULL,
	`createDate`	DATE	NOT NULL,
	`userName`	VARCHAR(50)	NOT NULL,
	`userNickName`	VARCHAR(50)	NOT NULL,
	`userZipcode`	VARCHAR(6)	NOT NULL,
	`userAddress1`	VARCHAR(50)	NOT NULL,
	`userAddress2`	VARCHAR(50)	NOT NULL,
	`userHp`	VARCHAR(50)	NOT NULL,
	`userAuthor`	INT	NOT NULL
);

CREATE TABLE `leave` (
	`levId`	VARCHAR(50)	NOT NULL,
	`userId`	VARCHAR(50)	NOT NULL,
	`levDate`	DATE	NOT NULL,
	`userName`	VARCHAR(50)	NOT NULL,
	`userNickName`	VARCHAR(50)	NOT NULL,
	`userAuthor`	INT	NOT NULL
);

CREATE TABLE `board` (
	`boardId`	VARCHAR(50)	NOT NULL,
	`userId`	VARCHAR(50)	NOT NULL,
	`categoryId`	VARCHAR(50)	NOT NULL,
	`title`	VARCHAR(50)	NOT NULL,
	`contents`	TEXT	NULL,
	`createDate`	DATE	NOT NULL,
	`modifyDate`	DATE	NOT NULL,
	`show`	INT	NOT NULL
);

CREATE TABLE `brdCategory` (
	`categoryId`	VARCHAR(50)	NOT NULL,
	`crdName`	VARCHAR(50)	NOT NULL
);

CREATE TABLE `review` (
	`reviewId`	VARCHAR(50)	NOT NULL,
	`userId`	VARCHAR(50)	NOT NULL,
	`prdId`	VARCHAR(50)	NOT NULL,
	`packageID`	VARCHAR(50)	NOT NULL,
	`title`	VARCHAR(50)	NOT NULL,
	`contents`	TEXT	NOT NULL,
	`createDate`	DATE	NOT NULL,
	`modifyDate`	DATE	NOT NULL,
	`show`	INT	NOT NULL,
	`point`	INT	NULL
);

CREATE TABLE `product` (
	`prdId`	VARCHAR(50)	NOT NULL,
	`stateId`	VARCHAR(50)	NOT NULL,
	`packageID`	VARCHAR(50)	NOT NULL,
	`company`	VARCHAR(50)	NOT NULL,
	`prdName`	VARCHAR(50)	NOT NULL,
	`prdImg`	TEXT	NULL,
	`price`	INT	NOT NULL,
	`contents`	TEXT	NULL
);

CREATE TABLE `orderInfo` (
	`ordNo`	VARCHAR(50)	NOT NULL,
	`userId`	VARCHAR(50)	NOT NULL,
	`ordDate`	DATE	NOT NULL,
	`receiver`	VARCHAR(50)	NOT NULL,
	`ordZipCode`	VARCHAR(50)	NOT NULL,
	`address1`	VARCHAR(50)	NOT NULL,
	`address2`	VARCHAR(50)	NOT NULL,
	`rcvPhone`	VARCHAR(50)	NOT NULL,
	`rcvNotice`	TEXT	NULL,
	`payment`	INT	NOT NULL,
	`price`	INT	NOT NULL
);

CREATE TABLE `orderProduct` (
	`ordPrdId`	VARCHAR(50)	NOT NULL,
	`prdId`	VARCHAR(50)	NOT NULL,
	`ordNo`	VARCHAR(50)	NOT NULL,
	`packageID`	VARCHAR(50)	NOT NULL,
	`ordQty`	INT	NULL
);

CREATE TABLE `cart` (
	`cartId`	VARCHAR(50)	NOT NULL,
	`userId`	VARCHAR(50)	NOT NULL,
	`prdId`	VARCHAR(50)	NOT NULL,
	`packageID`	VARCHAR(50)	NOT NULL,
	`cartQty`	INT	NULL
);

CREATE TABLE `state` (
	`stateId`	VARCHAR(50)	NOT NULL,
	`stateCode`	VARCHAR(10)	NOT NULL,
	`stateName`	VARCHAR(50)	NOT NULL
);

CREATE TABLE `package` (
	`packageID`	VARCHAR(50)	NOT NULL,
	`packageName`	VARCHAR(50)	NOT NULL
);

CREATE TABLE `pckElenments` (
	`packElementId`	VARCHAR(50)	NOT NULL,
	`packageID`	VARCHAR(50)	NOT NULL,
	`packageName`	VARCHAR(50)	NOT NULL,
	`pakCheck`	INT	NOT NULL
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`userId`
);

ALTER TABLE `leave` ADD CONSTRAINT `PK_LEAVE` PRIMARY KEY (
	`levId`,
	`userId`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`boardId`,
	`userId`,
	`categoryId`
);

ALTER TABLE `brdCategory` ADD CONSTRAINT `PK_BRDCATEGORY` PRIMARY KEY (
	`categoryId`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`reviewId`,
	`userId`,
	`prdId`,
	`packageID`
);

ALTER TABLE `product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`prdId`,
	`stateId`,
	`packageID`
);

ALTER TABLE `orderInfo` ADD CONSTRAINT `PK_ORDERINFO` PRIMARY KEY (
	`ordNo`,
	`userId`
);

ALTER TABLE `orderProduct` ADD CONSTRAINT `PK_ORDERPRODUCT` PRIMARY KEY (
	`ordPrdId`,
	`prdId`,
	`ordNo`,
	`packageID`
);

ALTER TABLE `cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`cartId`,
	`userId`,
	`prdId`,
	`packageID`
);

ALTER TABLE `state` ADD CONSTRAINT `PK_STATE` PRIMARY KEY (
	`stateId`
);

ALTER TABLE `package` ADD CONSTRAINT `PK_PACKAGE` PRIMARY KEY (
	`packageID`
);

ALTER TABLE `pckElenments` ADD CONSTRAINT `PK_PCKELENMENTS` PRIMARY KEY (
	`packElementId`,
	`packageID`
);

ALTER TABLE `leave` ADD CONSTRAINT `FK_user_TO_leave_1` FOREIGN KEY (
	`userId`
)
REFERENCES `user` (
	`userId`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_user_TO_board_1` FOREIGN KEY (
	`userId`
)
REFERENCES `user` (
	`userId`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_brdCategory_TO_board_1` FOREIGN KEY (
	`categoryId`
)
REFERENCES `brdCategory` (
	`categoryId`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_user_TO_review_1` FOREIGN KEY (
	`userId`
)
REFERENCES `user` (
	`userId`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_product_TO_review_1` FOREIGN KEY (
	`prdId`
)
REFERENCES `product` (
	`prdId`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_product_TO_review_2` FOREIGN KEY (
	`packageID`
)
REFERENCES `product` (
	`packageID`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_state_TO_product_1` FOREIGN KEY (
	`stateId`
)
REFERENCES `state` (
	`stateId`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_package_TO_product_1` FOREIGN KEY (
	`packageID`
)
REFERENCES `package` (
	`packageID`
);

ALTER TABLE `orderInfo` ADD CONSTRAINT `FK_user_TO_orderInfo_1` FOREIGN KEY (
	`userId`
)
REFERENCES `user` (
	`userId`
);

ALTER TABLE `orderProduct` ADD CONSTRAINT `FK_product_TO_orderProduct_1` FOREIGN KEY (
	`prdId`
)
REFERENCES `product` (
	`prdId`
);

ALTER TABLE `orderProduct` ADD CONSTRAINT `FK_product_TO_orderProduct_2` FOREIGN KEY (
	`packageID`
)
REFERENCES `product` (
	`packageID`
);

ALTER TABLE `orderProduct` ADD CONSTRAINT `FK_orderInfo_TO_orderProduct_1` FOREIGN KEY (
	`ordNo`
)
REFERENCES `orderInfo` (
	`ordNo`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_user_TO_cart_1` FOREIGN KEY (
	`userId`
)
REFERENCES `user` (
	`userId`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_product_TO_cart_1` FOREIGN KEY (
	`prdId`
)
REFERENCES `product` (
	`prdId`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_product_TO_cart_2` FOREIGN KEY (
	`packageID`
)
REFERENCES `product` (
	`packageID`
);

ALTER TABLE `pckElenments` ADD CONSTRAINT `FK_package_TO_pckElenments_1` FOREIGN KEY (
	`packageID`
)
REFERENCES `package` (
	`packageID`
);

