# Google Sheets

Formulas are extremely fun, and useful. However sometimes hard to know what to do.

## Formulas

`importrange(sheet_url, range)`  
Grab from another Google sheets document some range of data.

`query(range, select_statement)`  
Make a new table with stuff from the select, reorder, "rollup" and all kinds of fun stuff.

**NOTE:** Ensure there is enough room for the table or the result will fail to show anything.

**NOTE:** When using a select_statement such as the following: `"select A, sum(B), C, sum(D) WHERE C <> '' group by A, C label sum(B) 'Hours', sum(D) 'Amount', A 'Project', C 'Sub-Proj'"` the column names (A, B, C, D) must match the columns on the sheet, this will break the query if you add/remove columns to the left of the query. Instead use: `query({range}, select_statement)` to force the columns into a different naming scheme, and change select to: `"select Col1, sum(Col2), Col3, sum(Col4) WHERE Col3 <> '' group by Col1, Col3 label sum(Col2) 'Hours', sum(Col4) 'Amount', Col1 'Project', Col3 'Sub-Proj'"` as this does not care if columns are added/removed to left of the query formula.
