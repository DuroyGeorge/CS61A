.read data.sql


CREATE TABLE bluedog AS
  SELECT color,pet from students where color="blue" and pet="dog";

CREATE TABLE bluedog_songs AS
  SELECT color,pet,song from students where color="blue" and pet="dog";


CREATE TABLE smallest_int_having AS
  SELECT time, smallest from students group by smallest having count(*)=1;


CREATE TABLE matchmaker AS
  SELECT first.pet,first.song,first.color,second.color from students as first,students as second where first.pet=second.pet and first.song=second.song and first.time<second.time;


CREATE TABLE sevens AS
  SELECT students.seven from students,numbers where students.time=numbers.time and students.number=7 and numbers."7"="True";


CREATE TABLE average_prices AS
  SELECT category,avg(MSRP) as average_price from products group by category;


CREATE TABLE lowest_prices AS
  SELECT store,item,price from inventory group by item having price=min(price);

CREATE TABLE helper AS
  SELECT category,name,MSRP/rating as ref from products group by category having ref=min(ref);

CREATE TABLE shopping_list AS
  SELECT item,store from lowest_prices,helper where lowest_prices.item=helper.name;


CREATE TABLE total_bandwidth AS
  SELECT sum(Mbs) from stores,shopping_list where stores.store=shopping_list.store;

