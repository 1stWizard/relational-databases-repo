---List the case number, type of crime and community area for 
---all crimes in community area number 18.
select CD.community_area_number, CD.community_area_name, CCD.primary_type from census_data CD
inner join chicago_crime_data CCD on CD.community_area_number = CCD.community_area_number
where CD.community_area_number = 18;

---List all crimes that took place at a school. Include case number, crime type and community name.
select CD.community_area_number, CD.community_area_name, CCD.primary_type from census_data CD
left outer join chicago_crime_data CCD on CD.community_area_number = CCD.community_area_number
where LCASE(CCD.location_description) like '%school%';

---For the communities of Oakland, Armour Square, Edgewater and CHICAGO list the associated 
---community_area_numbers and the case_numbers.
select CD.community_area_number, CD.community_area_name, CCD.case_number from census_data CD
full outer join chicago_crime_data CCD on CD.community_area_number = CCD.community_area_number
where CD.community_area_name in ('Oakland','Armour Square','Edgewater','CHICAGO');