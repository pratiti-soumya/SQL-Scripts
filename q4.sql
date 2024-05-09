select dept from Class where dept not in 
(
    select dept from Class where credits<>3
);