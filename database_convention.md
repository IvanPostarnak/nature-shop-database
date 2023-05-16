I decided to write down some rules about present databsae
----
GENERAL RULES are
+ names of tables should remain singular (country - NEVER countries)
+ _id primary keys fields should repeat name of table in whole (table_name -> table_name_id)
+ if entity / table had a 'name' property than column whould be named 'name' without repeating name of the table itself
+ all data that represents strings are written capitalized ('Plaster', not 'plaster')
+ all prices are meant to be written in dollars US
----
UNITS of MESUREMENT (column naming)    
(decided to use them in names of columns, according to possible need of it in future)
```
_mil ~ millions
_cm ~ centimeters
_kg ~ kilograms
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