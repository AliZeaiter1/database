CREATE TABLE Ugyfelrejtett
(
ID INT IDENTITY PRIMARY KEY,
LOGIN nvarchar(255)	MASKED WITH (Function = 'default()'),
EMAIL nvarchar(255) MASKED WITH (Function = 'email()'),
NEV nvarchar(255) MASKED WITH (Function = 'partial(1,"XXX",1)'),
SZULEV int MASKED WITH (Function = 'random(1,5)'),
NEM nvarchar(1),
CIM nvarchar(255) MASKED WITH (Function = 'default()')
);
Insert into Ugyfelrejtett
(LOGIN,EMAIL,NEV,SZULEV,NEM,CIM)
SELECT
LOGIN,EMAIL,NEV,SZULEV,NEM,CIM
from Ugyfel;

CREATE USER Admin WITHOUT Login;
GRANT SELECT ON Ugyfelrejtett TO Admin

EXECUTE AS User= 'Admin';
SELECT * FROM Ugyfelrejtett
