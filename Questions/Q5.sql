create Table Login(
Username Text Primary key,
Password Text Not Null,
LasteUpdate Text DATE DEFAULT (DATETIME(CURRENT_TIMESTAMP)),
Status Text  check (status = 'active' or status= 'inactive'),
CustomerID Integer,
foreign key (CustomerID) references customer (CustomerID));

