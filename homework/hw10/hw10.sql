CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;


-- All dogs with parents ordered by decreasing height of their parent
-- CREATE table helper AS
--   SELECT parent,name,second.height from parents,dogs as first,dogs as second where first.name=child and second.name=parent order by second.height desc;
CREATE TABLE by_parent_height AS
  SELECT first.name from parents,dogs as first,dogs as second where first.name=child and second.name=parent order by second.height desc;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name,size from dogs,sizes where min<height and height<=max;


-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT first.child as s1,second.child as s2 from parents as first,parents as second where first.parent=second.parent and first.child<second.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || s1 || " plus " || s2 ||" have the same size: " || first.size from siblings,size_of_dogs as first,size_of_dogs as second where first.name=s1 and second.name=s2 and first.size=second.size;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur,max(height)-min(height) from dogs group by fur having max(height)<=1.3*avg(height) and min(height)>= 0.7 * avg(height);

