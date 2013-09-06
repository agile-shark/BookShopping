create table bookuser(
  userid varchar2(20) not null,
  username varchar2(40) not null,
  userpass varchar2(40) not null,
  useremail varchar2(50) not null,
  userimage varchar2(50) default 'face/m66.gif',
  userphone varchar2(12),
  userqq varchar2(10),
  registdate date default sysdate,
  passquestion varchar2(50) not null,
  passanswer varchar2(50) ,
  sendaddress varchar2(200),
  bestsendgoodstime varchar2(20),
  userpostcode varchar2(10) default '130000',
  userhothouse varchar2(100),
  user_integration varchar2(20) default '0'
);
insert into bookuser
  (userid, username, userpass, useremail, userphone, userqq, passquestion, passanswer, sendaddress, bestsendgoodstime, userpostcode, userhothouse)
values
  ('1001','liangyongxing','liangyongxing','liangyongxing.mr@gmail.com','18943643561','356979945','我最喜爱的狗的名字？','doudou','山西省朔州市山阴县广益小区3区3牌5号','周末','130000','山阴县第二小学(逸夫小学)');

  
create table favorite(
  favoriteid varchar2(20),
  bookid varchar2(20),
  userid varchar2(20)
);
insert into favorite values('1001','27','1003');


create table message(
  message_id varchar2(20) not null,
  user_id varchar2(20) not null,
  message_title varchar2(20) not null,
  message_context varchar2(100) not null,
  message_date date default sysdate,
  message_type varchar2(20) not null,
  message_answer varchar2(100)
);
insert into message(message_id,user_id,message_title,message_context,message_type,message_answer) values('1001','1003','急需一本我想要的图书','我非常想要要一本关于如何找到人生真谛的书籍，希望你们能够尽快给我回复','求购','嗯，已收到您的留言，我会尽快帮您找到需要的书籍的，谢谢您光临本站，欢迎下次光临。');


create table sensitive(
   sen_id varchar2(20) not null,
   sen_context varchar2(40) not null
);
insert into sensitive values('1001','胡锦涛');
insert into sensitive values('1002','温家宝');
insert into sensitive values('1003','周永康');
insert into sensitive values('1004','习近平');
insert into sensitive values('1005','黄岩岛');
insert into sensitive values('1006','他妈的');
insert into sensitive values('1007','草');
insert into sensitive values('1008','操你妈');
insert into sensitive values('1009','滚蛋');
insert into sensitive values('1010','操');
insert into sensitive values('1011','李克强');
insert into sensitive values('1012','薄熙来');
insert into sensitive values('1013','浑蛋');
insert into sensitive values('1014','混蛋');
insert into sensitive values('1015','狗娘养的');
insert into sensitive values('1016','小样');
insert into sensitive values('1017','傻逼');
insert into sensitive values('1018','傻蛋');
insert into sensitive values('1019','傻根');
insert into sensitive values('1020','cao');


create table activity(
  activityid varchar2(20),
  activity_startdate varchar2(20),
  activity_stopdate varchar2(20),
  youhui_number number(4) default 1,
  tuangou_number number(4) default 5,
  activity_type varchar2(20) default 'youhui',
  bookid varchar2(20),
  activity_title varchar2(200) default '6.1活动火热进行中，疯狂抢购，跳楼价甩卖!'
);
insert into activity values('1001','2012-05-01','2012-05-17',12,10,'youhui','2','至此5.1活动来临，为了感谢新老客户多年的至此特降价酬宾。');
insert into activity values('1002','2012-05-11','2012-05-17',13,5,'youhui','6','由于销量很高，为了感谢顾客的相信，特此降价大酬宾');
insert into activity values('1003','2012-06-01','2012-06-11',33,13,'youhui','8','即将来临的6.1儿童节，特此对小朋友们公开和疯狂甩卖的的特价图书销售啦！');
insert into activity values('1004','2012-05-11','2012-05-17',13,5,'tuangou','7','6.1活动火热进行中，疯狂抢购，跳楼价甩卖!');
insert into activity values('1005','2012-05-17','2012-05-27',17,10,'tuangou','14','即将来临的6.1儿童节，特此对小朋友们公开和疯狂甩卖的的特价图书销售啦！');
insert into activity values('1006','2012-06-01','2012-06-12',37,20,'tuangou','21','6.1活动火热进行中，疯狂抢购，跳楼价甩卖!');
insert into activity values('1007','2012-05-17','2012-05-27',17,10,'tuangou','30','由于销量很高，为了感谢顾客的相信，特此降价大酬宾');
 
 
create table bookadmin(
  adminid varchar2(20) not null,
  adminname varchar2(40) not null,
  admintruename varchar2(40),
  adminpassword varchar2(50) not null,
  adminregisterdate date default sysdate,
  adminphone varchar2(20),
  adminemail varchar2(50),
  adminlastip varchar2(20) default '127.0.0.1'
);
insert into bookadmin(adminid,adminname,admintruename,adminpassword,adminphone,adminemail) values('1001','liangyongxingadmin','梁永星','liangyongxingadmin','18943643561','liangyongxing_mr@sina.cn');


 create table bookcar(
   orderid varchar2(20) not null,
   bookid varchar2(20) not null,
   bookbuynum number(5) default 0,
   bookwithprice number(7,2) default 0.0f,
   booktype varchar2(20),
   bookname varchar2(30)
 );
 
 
 create table bookevaluation(
   evaid number(4),
   bookid varchar2(20),
   userid varchar2(20),
   username varchar2(30),
   evacontent clob,
   evatitle varchar2(100),
   evadate date default sysdate,
   evarank number(2) default 5
);
insert into bookevaluation(evaid,bookid,userid,username,evacontent,evatitle,evarank) values(1,'1','1003','liangyongxing','书的价值很好，很值得阅读和收藏','书的价值',5);
insert into bookevaluation(evaid,bookid,userid,username,evacontent,evatitle,evarank) values(2,'1','1004','admin','书的价值很好，我买后感觉很值得,推荐大家买。','书的价值',3);
insert into bookevaluation(evaid,bookid,userid,username,evacontent,evatitle,evarank) values(3,'1','1021','renjunting','书的内容很好，内容新颖','书的内容',2);
insert into bookevaluation(evaid,bookid,userid,username,evacontent,evatitle,evarank) values(4,'1','1022','zhanghanbin','书整体感觉很好，尤其它的外表深深的吸引着我','书的外观',4);


 create table bookorder(
   orderid varchar2(20) not null,
   userid varchar2(20) not null,
   orderdate date default sysdate,
   sendprice number(7,2) default 0.0f,
   totalprice number(7,2) default 0.0f,
   sendaddress varchar2(100) not null,
   sendmode varchar2(20) not null,
   paymode varchar2(20) not null,
   isconfirmed int default 0,
   ispayed int default 0,
   sendstaus int default 0,
   ispackage int default 0,
   iscard int default 0
 );
 
 create table bookshopping(
	bookid number(7) not null enable,
	book_name varchar2(40) not null enable,
	book_author varchar2(40) not null enable,
	book_press varchar2(40) not null enable,
	book_out_date date not null enable,
	book_num number(7) not null enable,
	book_introduce varchar2(400),
	book_type varchar2(50) not null enable,
	book_isbn varchar2(30) not null enable,
	book_page number(6),
	book_text number(9),
	book_zhuangding varchar2(20) not null enable,
	book_banci number(2) not null enable,
	book_weight number(7,2),
	book_market_price number(7,2) not null enable,
	book_user_price number(7,2) not null enable,
	book_buy_count number(5) default 0,
	book_img varchar2(20) not null enable,
	book_is_delete number(2) default 0 not null enable,
	book_is_best number(2) default 0 not null enable,
	book_is_new number(2) default 0 not null enable,
	book_is_hot number(2) default 0 not null enable,
	type_id varchar2(20) not null enable,
	book_press_id varchar2(20) not null enable,
	book_is_tuangou number(1) default 0,
	book_is_youhui number(1) default 0
);

insert into bookshopping values(1,'VB程序设计','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1001',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu.jpg',0,1,0,0,'chengxu','qinghua',0,0);
insert into bookshopping values(2,'算法设计与分析','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1002',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu6.jpg',0,1,0,0,'chengxu','qinghua',0,1);
insert into bookshopping values(3,'数字多媒体技术基础','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1003',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu1.jpg',0,1,0,0,'chengxu','qinghua',0,0);
insert into bookshopping values(4,'网页设计与制作','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1004',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu2.jpg',0,1,0,0,'chengxu','qinghua',0,0);
insert into bookshopping values(5,'Flash动画制作教程','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1005',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu4.jpg',0,1,0,0,'chengxu','qinghua',0,0);
insert into bookshopping values(6,'AutoCAD绘图教程','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1006',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu5.jpg',0,1,0,0,'chengxu','qinghua',0,1);
insert into bookshopping values(7,'数据库技术与应用','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1007',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu7.jpg',0,1,0,0,'chengxu','qinghua',1,0);
insert into bookshopping values(8,'数据库技术与应用','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1008',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu8.jpg',0,1,0,0,'chengxu','qinghua',0,1);
insert into bookshopping values(9,'Web程序设计(第3版)','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1009',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu9.jpg',0,1,0,0,'chengxu','qinghua',0,0);
insert into bookshopping values(10,'信息系统分析与设计','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1010',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu10.jpg',0,1,0,0,'chengxu','qinghua',0,0);
insert into bookshopping values(11,'C++程序设计(第2版)','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1011',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu11.jpg',0,0,1,0,'chengxu','qinghua',0,0);
insert into bookshopping values(12,'C程序设计实验指导','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1012',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu12.jpg',0,0,1,0,'chengxu','qinghua',0,0);
insert into bookshopping values(13,'FoxPro程序设计教程','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','程序设计',
'ITNB1013',687,100000,'精装版',3,15.6,34.5,30.5,5,'chengxu13.jpg',0,0,1,0,'chengxu','qinghua',0,0);
insert into bookshopping values(14,'2011年中级会计资格','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','经融管理',
'ITNB1014',687,100000,'精装版',3,15.6,34.5,30.5,5,'caiwu.jpg',0,0,1,0,'jinrong','beijing',1,0);
insert into bookshopping values(15,'税务筹划学','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','经融管理',
'ITNB1015',687,100000,'精装版',3,15.6,34.5,30.5,5,'caiwu1.jpg',0,0,1,0,'jinrong','beijing',0,0);
insert into bookshopping values(16,'计量经济学','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','经融管理',
'ITNB1016',687,100000,'精装版',3,15.6,34.5,30.5,5,'jingji.jpg',0,0,1,0,'jinrong','beijing',0,0);
insert into bookshopping values(17,'财经法规与会计职业','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','经融管理',
'ITNB1017',687,100000,'精装版',3,15.6,34.5,30.5,5,'jingji2.jpg',0,0,1,0,'jinrong','beijing',0,0);
insert into bookshopping values(18,'财务成本管理','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','经融管理',
'ITNB1018',687,100000,'精装版',3,15.6,34.5,30.5,5,'jingji3.jpg',0,0,1,0,'jinrong','beijing',0,0);
insert into bookshopping values(19,'国际市场营销','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','经融管理',
'ITNB1019',687,100000,'精装版',3,15.6,34.5,30.5,5,'jingji4.jpg',0,0,1,0,'jinrong','beijing',0,0);
insert into bookshopping values(20,'财政与金融基础知识','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对软件程序设计的贯彻与深入，且可以培养学生对底层系统
更明确的了解，重磅推出了该书籍，详细且明了的阐述了程序设计的思想','经融管理',
'ITNB1020',687,100000,'精装版',3,15.6,34.5,30.5,5,'jingji5.jpg',0,0,1,0,'jinrong','beijing',0,0);
insert into bookshopping values(21,'新世纪大学英语教材','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','英语',
'ITNB1021',687,100000,'精装版',3,15.6,34.5,30.5,5,'english.jpg',0,0,0,1,'yingyu','xindongfang',1,0);
insert into bookshopping values(22,'造船专业英语','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','英语',
'ITNB1022',687,100000,'精装版',3,15.6,34.5,30.5,5,'english1.jpg',0,0,0,1,'yingyu','xindongfang',0,0);
insert into bookshopping values(23,'旅游英语','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','英语',
'ITNB1023',687,100000,'精装版',3,15.6,34.5,30.5,5,'english2.jpg',0,0,0,1,'yingyu','xindongfang',0,0);
insert into bookshopping values(24,'新视野大学英语','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','英语',
'ITNB1024',687,100000,'精装版',3,15.6,34.5,30.5,5,'english3.jpg',0,0,0,1,'yingyu','xindongfang',0,0);
insert into bookshopping values(25,'英语解题指导','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','英语',
'ITNB1025',687,100000,'精装版',3,15.6,34.5,30.5,5,'english4.jpg',0,0,0,1,'yingyu','xindongfang',0,0);
insert into bookshopping values(26,'英语听力教材','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','英语',
'ITNB1026',687,100000,'精装版',3,15.6,34.5,30.5,5,'english5.jpg',0,0,0,1,'yingyu','xindongfang',0,0);
insert into bookshopping values(27,'MBA入学英语考试','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','英语',
'ITNB1027',687,100000,'精装版',3,15.6,34.5,30.5,5,'english6.jpg',0,0,0,1,'yingyu','xindongfang',0,0);
insert into bookshopping values(28,'英语笔译实务','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','英语',
'ITNB1028',687,100000,'精装版',3,15.6,34.5,30.5,5,'english7.jpg',0,0,0,1,'yingyu','xindongfang',0,0);
insert into bookshopping values(29,'高级英语阅读','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','英语',
'ITNB1029',687,100000,'精装版',3,15.6,34.5,30.5,5,'english8.jpg',0,0,0,1,'yingyu','xindongfang',0,0);
insert into bookshopping values(30,'数学','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','数学',
'ITNB1030',687,100000,'精装版',3,15.6,34.5,30.5,5,'math.jpg',0,0,0,1,'shuxue','jixie',0,0);
insert into bookshopping values(31,'微积分','孟德欣,谢婷,王先花','北京大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','数学',
'ITNB1031',687,100000,'精装版',3,15.6,34.5,30.5,5,'math1.jpg',0,1,0,0,'shuxue','jixie',0,0);
insert into bookshopping values(32,'数控技术与应用','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','数学',
'ITNB1032',687,100000,'精装版',3,15.6,34.5,30.5,5,'math2.jpg',0,0,1,0,'shuxue','jixie',0,0);
insert into bookshopping values(33,'高等数学下册','孟德欣,谢婷,王先花','清华大学出版社'
,'09-11月-2010',3000,'为了促进对英语的贯彻与深入，且可以培养学生对与外国人交流
更明确的了解，重磅推出了该书籍，详细且明了的阐述了英语表达的思想','数学',
'ITNB1030',687,100000,'精装版',3,15.6,34.5,30.5,5,'math6.jpg',0,0,0,1,'shuxue','jixie',0,0);


create table alert
(
	contentid number(20) not null enable,
	contenttitle varchar2(40) not null enable,
	newtitle varchar2(20) not null enable,
	maincontent clob not null enable,
	alertauthor varchar2(20) not null enable,
	rank varchar(10) not null enable,
	createdate date not null enable
);
insert into alert values(1,'今天开人民代表大会了','会议通知','<p style="text-align: left; ">
	&nbsp;</p>
<div style="text-align: left; ">
	<strong>人民代表大会下设委员会</strong></div>
<div style="text-align: left; ">
	自治区、直辖市的人民代表大会；设区的市、自治州的人民代表大会；县、自治县、不设区的市、市辖区的人民代表大会；乡、民族乡、镇的人民代表大会。全国人民代表大会是最高国家权力机关，地方各级人民代表大会是地方国家权力机关。</div>
<div style="text-align: left; ">
	<strong>解释</strong></div>
<div style="text-align: left; ">
	　　人民代表大会的代表由民主选举产生。全国人民代表大会由省、自治区、直辖市、特别行政区和人民解放军选出的代表组成。省、自治区、直辖市、设区的市、自治州的人民代表大会由下一级人民代表大会选出的代表组成。县、自治县、不设区的市、市辖区，以及乡、民族乡、镇的人民代表大会由选民直接选出的代表组成。</div>
<div style="text-align: left; ">
	宪法</div>
<div style="text-align: left; ">
	　　在一九七五年宪法中有&amp;ldquo;中华人民共和国的一切权力属于人民。人民行使权力的机关，是以工农兵代表为主体的各级人民代表大会。&amp;rdquo;现行宪法则改为：&amp;ldquo;中华人民共和国的一切权力属于人民。人民行使国家权力的机关是全国人民代表大会和地方各级人民代表大会。</div>
<div style="text-align: left; ">
	<strong>具体</strong></div>
<div style="text-align: left; ">
	　　全国人民代表大会和全国人民代表大会常务委员会行使国家立法权。</div>
<div style="text-align: left; ">
	　　全国人民代表大会由省、自治区、直辖市、特别行政区和军队选出的代表组成。各少数民族都应当有适当名额的代表。</div>
<div style="text-align: left; ">
	　　全国人民代表大会代表的选举由全国人民代表大会常务委员会主持。</div>
<div style="text-align: left; ">
	　　全国人民代表大会代表名额和代表产生办法由法律规定。</div>
<div style="text-align: left; ">
	　　全国人民代表大会每届任期五年。</div>
<div style="text-align: left; ">
	　　全国人民代表大会任期届满的两个月以前，全国人民代表大会常务委员会必须完成下届全国人民代表大会代表的选举。如果遇到不能进行选举的非常情况，由全国人民代表大会常务委员会以全体组成人员的三分之二以上的多数通过，可以推迟选举，延长本届全国人民代表大会的任期。在非常情况结束后一年内，必须完成下届全国人民代表大会代表的选举。&lt;/div&gt;</div>
<div style="text-align: left; ">
	　　全国人民代表大会会议每年举行一次，五年为一届。由全国人民代表大会常务委员会召集。如果全国人民代表大会常务委员会认为必要，或者有五分之一以上的全国人民代表大会代表提议，可以临时召集全国人民代表大会会议。</div>
<div style="text-align: left; ">
	　　全国人民代表大会举行会议的时候，选举主席团主持会议。</div>
<div style="text-align: left; ">
	&nbsp;</div>
<div>
	&nbsp;</div>
','张汉斌','7-4月-2012');



insert into alert values(2,'清华大学出版社图书促销','图书促销','<p style="text-align:left;">
	<strong>促销活动种类</strong></p>
<p style="text-align:left;">
	&nbsp;&nbsp; &nbsp; 1、限时折扣，即门店在特定营业时段内，提供优惠商品，刺激消费者购买的促销活动。</p>
<p style="text-align:left;">
	&nbsp;</p>
<p style="text-align:left;">
	　　2、面对面销售，即门店的店员直接与顾客面对面进行促销和销售的活动。</p>
<p>
	&nbsp;</p>
<p style="text-align:left;">
	　　3、赠品促销，即消费者免费或付出某些代价即可获得特定物品的促销活动。</p>
<p style="text-align:left;">
	&nbsp;</p>
<p style="text-align:left;">
	　　4、免费试用，现场提供免费样品供消费者使用的促销活动。</p>
<p>
	&nbsp;</p>
<p style="text-align:left;">
	<strong>促销活动目的</strong></p>
<p style="text-align:left;">
	　　对市场现状及活动目的进行阐述。市场现状如何?开展这次活动的目的是什么?是处理库存?是提升销量?是打击竞争对手?是新品上市?还是提升品牌认知度及美誉度?只有目的明确，才能使活动有的放矢。</p>
<p>
	&nbsp;</p>
<p style="text-align:left;">
	<strong>促销活动主题</strong></p>
<p style="text-align:left;">
	　　在这一部分，主要是解决两个问题：</p>
<p style="text-align:left;">
	　　1、确定活动主题</p>
<p style="text-align:left;">
	　　2、包装活动主题</p>
<p style="text-align:left;">
	　　降价?价格折扣?赠品?抽奖?礼券?服务促销?演示促销?消费信用?还是其它促销工具?选择什么样的促销工具和什么样的促销主题，要考虑到活动的目标、竞争条件和环境及促销的费用预算和分配。</p>
<p>
	&nbsp;</p>
<p style="text-align:left;">
	<strong>促销活动方式</strong></p>
<p style="text-align:left;">
	　　1、确定伙伴：拉上政府做后盾，还是挂上媒体的&ldquo;羊头&rdquo;来卖自已的&ldquo;狗肉&rdquo;?是厂家单独行动，还是和经销商联手?或是与其它厂家联合促销?和政府或媒体合作，有助于借势和造势;和经销商或其它厂家联合可整合资源，降低费用及风险。</p>
<p>
	&nbsp;</p>
<p style="text-align:left;">
	　　2、确定刺激程度：要使促销取得成功，必须要使活动具有刺激力，能刺激目标对象参与。刺激程度越高，促进销售的反应越大。但这种刺激也存在边际效应。因此必须根据促销实践进行分析和总结，并结合客观市场环境确定适当的刺激程度和相应的费用投入。</p>


','张汉斌','7-4月-2012');



insert into alert values(3,'计算机知识普及 ','知识普及','<p style="text-align:left;">
	<strong><strong>The content author is zhanghanbin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></strong></p>
<p style="text-align:left;">
	<strong><strong>&nbsp;&nbsp;&nbsp;&nbsp; This book is a thorough rewrite of the first edition to reflect all of the changes introduced in C++ by the finalization of the C++ Standard, and also to reflect what I&#39;ve learned since writing the first edition. The entire text present in the first edition has been examined and rewritten, sometimes removing old examples, often changing existing examples and adding new ones, and adding many new exercises. Significant rearrangement and re-ordering of the material took place to reflect the availability of better tools and my improved understanding of how people learn C++. A new chapter was added which is a rapid introduction to the C concepts and basic C++ features for those who don&#39;t have the C background to tackle the rest of the book. The CD ROM bound into the back of the book contains a seminar that is an even gentler introduction to the C concepts necessary to understand C++ (or Java). It was created by Chuck Allison for my company (MindView, Inc.), and it&#39;s called &quot;Thinking in C: Foundations for Java and C++.&quot; It introduces you to the aspects of C that are necessary for you to move on to C++ or Java, leaving out the nasty bits that C programmers must deal with on a day-to-day basis but that the C++ and Java languages steer you away from (or even eliminate, in the case of Java).</strong></strong></p>
<p style="text-align:left;">
	<strong>&nbsp;</strong></p>

','张汉斌','7-4月-2012');

insert into alert values(4,'c++ primer ','图书推荐','<p style="text-align: justify">
	<span style="font-size: 14px"><strong>内容简介</strong></span><br />
	　　本版对前一版进行了彻底的修订，内容经过了重新组织，更加入了C++先驱Barbara E.Moo在C++教学方面的真知灼见。既显著改善了可读性，又充分体现了C++语言的最新进展和当前的业界最佳实践。书中不但新增大量教学辅助内容，用于强调重要的知识点，提醒常见的错误，推荐优秀的编程实践，给出使用提示，还包含大量来自实战的示例和习题。<br />
	　　对C++基本概念和技术全面而且权威的阐述，对现代C++编程风格的强调，使本书成为C++初学者的最佳指南；对于中高级程序员，本书也是不可或缺的参考书。<br />
	编辑本段作者简介<br />
	　　Stanley B.Lippman的职业是提供关于C++和面向对象的训练、咨询、设计和指导。他在成为一名独立咨询顾问之前，曾经是迪士尼动画公司的首席软件设计师。当他在AT&amp;T Bell实验室的时候，领导了cfront 3.0版本和2.1版本的编译器开发组。他也是Bjarne Stroustrup领导的Bell实验室Foundation项目的成员之一，负责C++程序设计环境中的对象模型部分。他还撰写了许多关于C++的文章。目前他已受雇于微软公司，负责Visual C++项目。遍及全球，深受广大C++学者的喜欢。<br />
	　　Barbara E．Moo 是独立咨询顾问，在软件领域中拥有超过20年的工作经验的独立咨询顾问。在AT&amp;Tm作的近15年中，她参与了第一个使用C++编写的商业产品的开发，领导了公司中第一个C++编译器项目，管理了AT&amp;T中广受赞誉的World Net Internet Service Business的开发。</p>

','张汉斌','7-4月-2012');


insert into alert values(5,'软件工程导论','图书推荐','<p style="text-align: justify">
	<strong>内容简介</strong><br />
	　　《软件工程导论》围绕软件工程最基本的核心&mdash;&mdash;&ldquo;质量和生产率&rdquo;展开，力求通过一些具体的实例来说明软件工程的思想和方法。《软件工程导论》在回答为什么要研究软件工程问题之后，首先系统地给出软件工程的知识体系框架，帮助读者建立起软件工程的完整且清晰的概念。然后深入软件过程、软件工程目标和要求的讨论，全面阐述了软件工程的思想、方法、技术和工具，结合软件工程环境、软件项目管理等内容，使读者坚实地掌握和运用软件工程的知识内涵。<br />
	　　《软件工程导论》内容丰富，构思新颖，突破软件工程图书的传统框架，使整个软件工程体系更清晰，从思想和管理出发，自然延伸到流程、方法、工具和环境，重新阐释了软件工程体系。《软件工程导论》吸收了软件工程的最新进展，适应软件即服务（SaaS）的开发模式，增加了相应的内容，符合当今软件工程的实际需求<br />
	编辑推荐<br />
	　　《软件工程导论》系统性强、通俗易懂，内容丰富且实用，理论和实践有效地结合，可作为高等学校的软件工程专业、计算机软件专业和相关专业的教材，也适合各类软件工程管理人员和技术人员学习。<br />
	　　《软件工程导论》将揭示软件工程的实质和内涵，围绕软件工程最基本的核心&mdash;&mdash;&ldquo;质量和生产率&rdquo;展开，充分阐述软件工程的系统思想、方法体系和过程运行轨迹，从而帮助读者建立其软件工程的完整而清晰的概念，帮助读者理解学习软件工程的意义和内容，在思想高度上指导软件工程专业的其他课程学习。</p>



','张汉斌','7-4月-2012');

insert into alert values(6,'计算机操作系统 ','图书推荐','<p style="text-align: justify">
	<strong>内容简介</strong><br />
	　　《软件工程导论》围绕软件工程最基本的核心&mdash;&mdash;&ldquo;质量和生产率&rdquo;展开，力求通过一些具体的实例来说明软件工程的思想和方法。《软件工程导论》在回答为什么要研究软件工程问题之后，首先系统地给出软件工程的知识体系框架，帮助读者建立起软件工程的完整且清晰的概念。然后深入软件过程、软件工程目标和要求的讨论，全面阐述了软件工程的思想、方法、技术和工具，结合软件工程环境、软件项目管理等内容，使读者坚实地掌握和运用软件工程的知识内涵。<br />
	　　《软件工程导论》内容丰富，构思新颖，突破软件工程图书的传统框架，使整个软件工程体系更清晰，从思想和管理出发，自然延伸到流程、方法、工具和环境，重新阐释了软件工程体系。《软件工程导论》吸收了软件工程的最新进展，适应软件即服务（SaaS）的开发模式，增加了相应的内容，符合当今软件工程的实际需求<br />
	编辑推荐<br />
	　　《软件工程导论》系统性强、通俗易懂，内容丰富且实用，理论和实践有效地结合，可作为高等学校的软件工程专业、计算机软件专业和相关专业的教材，也适合各类软件工程管理人员和技术人员学习。<br />
	　　《软件工程导论》将揭示软件工程的实质和内涵，围绕软件工程最基本的核心&mdash;&mdash;&ldquo;质量和生产率&rdquo;展开，充分阐述软件工程的系统思想、方法体系和过程运行轨迹，从而帮助读者建立其软件工程的完整而清晰的概念，帮助读者理解学习软件工程的意义和内容，在思想高度上指导软件工程专业的其他课程学习。</p>

<p style="text-align: justify">
	<strong>windows7操作系统</strong></p>
<p style="text-align: justify">
	windows xp操作系统<br />
	操作系统在计算机系统中的地位：<br />
	　　操作系统是软件，而且是系统软件。它在计算机系统中的作用，大致可以从两方面体会：对内，操作系统管理计算机系统的各种资源，扩充硬件的功能；对外，操作系统提供良好的人机界面，方便用户使用计算机。它在整个计算机系统中具有承上启下的地位。<br />
	编辑本段windows系统<br />
	　　微软自1985年推出Windows 1.0以来，Windows系统经历了十多年风风雨雨。从最初运行在DOS下的<br />
	&nbsp;&nbsp; [windows95操作系统]</p>
<p style="text-align: justify">
	windows95操作系统<br />
	Windows 3.x，到现在风靡全球的Windows 9x、Windows 2000、Windows XP、Windows 2003。Windows代替了DOS曾经担当的位子。 鲜艳的色彩、动听的音乐、前所未有的易用性，以及令人兴奋的多任务操作，使电脑操作成为一种享受。点几下鼠标就能完成工作，还可以一边用&ldquo;CD播放器&rdquo;放CD，一边用WORD写文章，这是多么悠闲的事情，这都是Windows带给人们的礼物。 最初的Windows 3.x系统只是DOS的一种16位应用程序，但在Windows 3.1中出现了剪贴板、文件拖动等功能，这些和Windows的图形界面使用户的操作变得简单。当32位的Windows 95发布的时候，Windows3.x中的某些功能被保留了下来。 Windows的流行让人们感到吃惊，几乎所有家庭用户的电脑上都安装了Windows，大部分的商业用户也选择了它。一时间，蓝天白云出现在世界各个角落。 Windows 98是Windows 9x的最后一个版本，在它以前有Windows 95和Windows 95 OEM两个版本，Windows 95 OEM也就是常说的Windows 97，其实这三个版本并没有很大的区别，它们都是前一个版本的改良产品。越到后来的版本可以支持的硬件设备种类越多，采用的技术也越来越先进。Windows ME(Windows千禧版)具有Windows 9x和Windows 2000的特征，它实际上是由Windows 98改良得到的，但在界面和某些技术方面是模仿Windows 2000。微软声称在Windows ME中去除掉了DOS，不再以DOS为基础。但实际上并不是如此，DOS仍然存在，只不过不能通过正常步骤进入，各种媒体上已有《恢复WindowsME的实DOS模式》一类的文章出现。Windows 2000即Windows NT 5.0，这是微软为解决Windows 9x系统的不稳定和Windows NT的多媒体支持不足推出的一个版本。它分为Windows 2000 Perfessional和Windows 2000 Sever两种版本，前者是面向普通用户的，后者则是面向网络服务器的。后者的硬件要求要高于前者。 Windows的优点 Windows之所以如此流行，是因为它有吸引功能上的强大以及Windows的易用性。 1、界面图形化 以前DOS的字符界面使得一些用户操作起来十分困难，Mac首先采用了图形界面和使用鼠标，这就使得人们不必学习太多的操作系统知识，只要会使用鼠标就能进行工作，就连几岁的小孩子都能使用。这就是界面图形化的好处。在Windows中的操作可以说是&ldquo;所见即所得&rdquo;，所有的东西都摆在你眼前，只要移动鼠标，单击、双击即可完成。 2、多用户、多任务 Windows系统可以使多个用户用同一台电脑而不会互相影响。Windows 9x在此方面做得很不好，多用户设置形同虚设，根本起不到作用。</p>

','张汉斌','7-4月-2012');