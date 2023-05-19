I decided to write down some rules about present databsae
----
GENERAL RULES are
+ names of tables must remain singular (country - NEVER countries) EXCEPT such cases as contacts, params, statistics, preferences etc
+ _id primary keys fields must repeat name of table in whole (table_name -> table_name_id)
+ if entity / table had a 'name' property than column must be named 'name' without repeating name of the table itself (name - NOT product_name)
+ all data in cells that represents strings are written capitalized ('Plaster', not 'plaster')
+ all prices are meant to be written in dollars US
+ in _contacts table all columns DO NOT repeat contact word, so that contact_name, contact_phone and contact_email must be just name, phone and email
+ contact information must NOT have 'NOT NULL' constraint and must have 'UNIQUE' constraint
+ all foreign keys that describe entities (such as shop_id, customer_id etc) must have constraint 'UNIQUE'
----
! I know, that following rules are breaking conventions of abstraction and encapsulation, but I'll need it to come back after a while (anyway it'll need refactoring)
----
UNITS of MESUREMENT (column naming)    
(decided to use them in names of columns, according to possible need of it in future)
```
_mil ~ millions
_cm ~ centimeters
_kg ~ kilograms
_g ~ grams
```
----
DATA TYPES (column naming)  
(one should set them excplicitly every time it is not obvious)
```
_date ~ date
_ts ~ timestamp
_tstz ~ timestamp with timezone
_mod ~ modification OR modificator - who knows ? abstraction...
_num ~ number
_time ~ TIME
```
----
CONSTRAINT's naming  
(one should set constraints explicitly, declaring user's names for them)
```
'pk_' prefix means 'PRIMARY KEY'
'unq_' prefix means 'UNIQUE'
'fk_' prefix means 'FOREIGN KEY'
'sfk_' prefix means 'FOREIGN KEY' that references this own table
'chk_' prefix means 'CHECK()'
```

structure of naming constraints should follow these ones
```
pk_[table_name]_[column_name]
fk_[table]_[column_of_this_table]_[ref_table]_[column_of_ref_table]
unq_[table_name]_[column_name]
chk_[table_name]_[column_name_1]_[column_name_2]*...
```