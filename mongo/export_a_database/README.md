# Export/import mongodb-data

## To export a collection within a database use:
```
mongoexport --db alerts --collection tenant_alerts --out test.json
```

To export an entire database name every collection(!) and export separately.

Link: https://docs.mongodb.com/manual/reference/program/mongoexport/

## To import a collection into a database

First make sure the database is created.
Than do the import
```
mongoimport --db alerts  --collection import_test <  test.json
```





