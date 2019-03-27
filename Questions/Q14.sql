CREATE TRIGGER UndeleteU2Track
AFTER DELETE
ON track WHEN name like '%U2%'
BEGIN
insert into track values (old.trackid,old.name,old.albumid,old.mediatypeid,old.genreid,old.composer,old.millisecond,old.byte,old.unitprice);
END;