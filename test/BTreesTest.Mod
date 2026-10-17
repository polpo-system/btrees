MODULE BTreesTest;  (** BTreesTest.Run: keys inserted into B-trees in a file, searched, the file opened again *)

IMPORT Files, BTrees, Out := out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Run*;
VAR f: Files.File; T: BTrees.Tree; i, org: LONGINT; res: INTEGER; ok: BOOLEAN; key: ARRAY 8 OF CHAR;
BEGIN
  fails := 0; checks := 0;
  f := Files.New("zq_test.bt"); T := BTrees.NewLInt(f, 0, 16);
  i := 0; WHILE i < 500 DO BTrees.InsertLInt(T, i * 7, i, res); INC(i) END;
  ok := TRUE; i := 0;
  WHILE i < 500 DO BTrees.SearchLInt(T, i * 7, org, res); IF (res # BTrees.Done) OR (org # i) THEN ok := FALSE END; INC(i) END;
  Check("500 numbers inserted and found", ok);
  BTrees.SearchLInt(T, 3, org, res); Check("3 not there", res # BTrees.Done);
  BTrees.Flush(T); Files.Register(f);
  f := Files.Old("zq_test.bt"); T := BTrees.Old(f, 0);
  BTrees.SearchLInt(T, 700, org, res); Check("found in the file opened again", (res = BTrees.Done) & (org = 100));
  f := Files.New("zq_test2.bt"); T := BTrees.NewStr(f, 0, 16);
  key := "alpha"; BTrees.InsertStr(T, key, 1, res); key := "beta"; BTrees.InsertStr(T, key, 2, res);
  BTrees.SearchStr(T, "beta", org, res); Check("a string key found", (res = BTrees.Done) & (org = 2));
  Out.String("BTreesTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END BTreesTest.
