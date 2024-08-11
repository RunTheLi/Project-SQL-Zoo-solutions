-- COALESCE EXAMPLE

-- COALESCE takes any number of arguments and returns the first value that is not null.

  COALESCE(x,y,z) = x if x is not NULL
  COALESCE(x,y,z) = y if x is NULL and y is not NULL
  COALESCE(x,y,z) = z if x and y are NULL but z is not NULL
  COALESCE(x,y,z) = NULL if x and y and z are all NULL

-- 1
--COALESCE can be useful when you want to replace a NULL value with some other value.
--In this example you show the name of the party for each MSP that has a party.
--For the MSP with no party (such as Canavan, Dennis) you show the string None.

SELECT name, party
      ,COALESCE(party,'None') AS aff
  FROM msp WHERE name LIKE 'C%'
