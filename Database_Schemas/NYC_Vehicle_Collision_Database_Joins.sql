-- Creating a table using a join that combines the collisions table and the date_time table on the unique collision ID
select collisions."COLLISION_ID",
    collisions."NUMBER OF PERSONS INJURED",
    collisions."NUMBER OF PERSONS KILLED",
    date_time."CRASH DATE",
    date_time."CRASH TIME"
into join_1
from collisions
right join date_time
on collisions."COLLISION_ID" = date_time."COLLISION_ID";

-- Creating a second table using a join that combines the previous join table and the locations table on the unique collision ID to create a table with all the relevant data
select join_1."COLLISION_ID",
    join_1."NUMBER OF PERSONS INJURED",
    join_1."NUMBER OF PERSONS KILLED",
    join_1."CRASH DATE",
    join_1."CRASH TIME",
    locations."BOROUGH",
    locations."ZIP CODE"
into all_data
from join_1
right join locations
on join_1."COLLISION_ID" = locations."COLLISION_ID";