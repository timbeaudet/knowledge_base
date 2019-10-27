
# Copy a MySQL table from one database to another

1. `CREATE TABLE destination_name LIKE source_name;`
2. `INSERT INTO destination_name SELECT * FROM source_name;`

## To copy from production database to development developmt do:

```
CREATE TABLE development.table_name LIKE production.table_name;
INSERT INTO development.table_name SELECT * FROM production.table_name;
```
