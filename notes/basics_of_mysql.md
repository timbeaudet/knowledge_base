# Basics of MySQL

## Getting Started

I created a database on my webhost, DreamHost.
It took awhile to get logged in for multiple reasons:
- Potentially required waiting time for propogation. (**Solution:** Wait a few hours)
- Attempting to run mysql from local macOS machine. (**Solution:** Use ssh to host first)
- There was also a mixup with my password. (**Solution:** ? Make new user/pass ?)

## Simple Commands

Common usage of MySQL seems to have commands in SCREAMING CAPS, although it is case-insensitive. It would seem string compares are typically case-insensitive as well. Each command also ends with a `;`. When this detail is forgotten the prompt will let you know. Instead of displaying `mysql>` it will display `    ->`

### SHOW TABLES;
This will output each of the tables contained in the database.

```
mysql> SHOW TABLES;
+-----------------------------+
| Tables_in_tyrebyes_testdata |
+-----------------------------+
| cars                        |
| laptimes                    |
| tracks                      |
| users                       |
+-----------------------------+
4 rows in set (0.00 sec)
```

### DESCRIBE table_name;
Shows each field in the table, the type and some other constraints that may be applied to that field as well.
```
mysql> DESCRIBE cars;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| car_id       | int(11)      | NO   | PRI | NULL    |       |
| car_fullname | varchar(128) | NO   | UNI | NULL    |       |
| car_name     | varchar(5)   | NO   | UNI | NULL    |       |
+--------------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)
```

### CREATE TABLE
If the database was _just_ created it is empty, no tables or information. Likely the first command desired then is to create a table. Before you do that it requires a bit of planning. What information does the table need to contain, what are descriptive names for each columns, what constraints are desired.

```
mysql> CREATE TABLE cars(car_id INT UNIQUE NOT NULL, car_fullname VARCHAR(128) UNIQUE NOT NULL, car_name VARCHAR(5) UNIQUE NOT NULL);
```

The following command creates the cars table described above. Each row will have an integer for car_id that must be unique to the other entries, car_fullname for the long name "Mazda Miata" of the car; also remaining unique and a car_name for an abbreviation/short name; "mm" - again unique against all other rows.

I have found it difficult / impossible? to add some constraints to or rename a column after the fact, so ensure you create it as desired. I've had to `DROP TABLE table_name;` a few times.

### DROP TABLE
This simply deletes the table and all data from within the database. Use with extreme caution.

```
mysql> DROP TABLE temp;
Query OK, 0 rows affected (0.02 sec)
```

### RENAME TABLE
It was quite easy to rename the table, but does feel odd speaking to a computer with such natural language.

```
mysql> ALTER TABLE old_name RENAME TO new_name;
Query OK, 0 rows affected (0.03 sec)
```

### INSERT INTO
Now that a table has been created data needs to be added. Run a few inserts to put some data into the cars tables, make sure to keep everything unique to other rows if using the same table layout.

```
mysql> INSERT INTO cars VALUES(5, "Dodge Viper", "DV");
Query OK, 1 row affected (0.00 sec)
```

Of course the number and types of VALUES depends on the table layout. Remember `DESCRIBE table_name` will show that information. If you wish to insert by only supplying information for a subset of columns you can with:

```
mysql> INSERT INTO cars(car_fullname) VALUES("Porsche 911");
Query OK, 1 row affected, 2 warnings (0.00 sec)
```

Of course doing so could result in a duplcate entry, so be aware of that.

### DELETE

Sometimes you add information you wish not to be there, like the Porsche didn't get a car_name, and the id was defaulted to 0.

```
mysql> DELETE FROM cars WHERE car_fullname="Porsche 911";
Query OK, 1 row affected (0.00 sec)
```

### SELECT
This command will get significant usage as it displays the contents of the tables in various ways. To display the entire table use:

```
mysql> SELECT * FROM cars;
+--------+---------------+----------+
| car_id | car_fullname  | car_name |
+--------+---------------+----------+
|      1 | Chevrolet S10 | CS10     |
|      2 | Dodge Neon    | DN       |
|      3 | Mazda Miata   | MM       |
|      4 | Lotus Elise   | LE       |
|      5 | Dodge Viper   | DV       |
+--------+---------------+----------+
5 rows in set (0.00 sec)
```

Say you only care about the id and fullname, you can specify these in the select as well:

```
mysql> SELECT car_fullname, car_id FROM cars;
+---------------+--------+
| car_fullname  | car_id |
+---------------+--------+
| Chevrolet S10 |      1 |
| Dodge Neon    |      2 |
| Dodge Viper   |      5 |
| Lotus Elise   |      4 |
| Mazda Miata   |      3 |
+---------------+--------+
5 rows in set (0.00 sec)
```

It can even get a lot more complex, here looking for fullnames that contain the substring Dodge, notice `%` is used as a wildcard character.

```
mysql> SELECT car_fullname, car_name FROM cars WHERE car_fullname LIKE "%Dodge%";
+--------------+----------+
| car_fullname | car_name |
+--------------+----------+
| Dodge Neon   | DN       |
| Dodge Viper  | DV       |
+--------------+----------+
2 rows in set (0.00 sec)
```

### UPDATE

Another very common thing to do is to update a value. To change the abbreviation for the Mazda Miata one could do the following:

```
mysql> UPDATE cars SET car_name="MX5" WHERE car_id=3;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0
```

And now when we check what that row contains:

```
mysql> SELECT * FROM cars WHERE car_name="MX5";
+--------+--------------+----------+
| car_id | car_fullname | car_name |
+--------+--------------+----------+
|      3 | Mazda Miata  | MX5      |
+--------+--------------+----------+
1 row in set (0.00 sec)
```
