select gid, nam, st_x(geom), st_y(geom) from policestation;
select * from policestation;
select gid, nam, st_astext(geom) from policestation;

-- 좌표찾기
select nam2, st_x(geom), st_y(geom) from subway_station where nam2 = '공덕역';
-- 마포구의 중심점
select sgg_nm, st_centroid(geom) from admin_sgg where sgg_nm = '마포구';
select sgg_nm, st_centroid(geom), st_x(st_centroid(geom)), st_y(st_centroid(geom)) from admin_sgg where sgg_nm = '마포구';
-- 서울시 위도, 경도 구하기
select sid_nm, st_centroid(geom) from admin_sid where sid_nm = '서울특별시';
-- setsrid -> 얘는 ~좌표계입니다!!라는 것
select sid_nm, st_transform(st_setsrid(st_centroid(geom), 5174), 4326) from admin_sid where sid_nm = '서울특별시';
select sid_nm, st_x(st_transform(st_setsrid(st_centroid(geom), 5174), 4326)), st_y(st_transform(st_setsrid(st_centroid(geom), 5174), 4326)) from admin_sid where sid_nm = '서울특별시';

-- 넓이 구하기
select st_area(geom) from admin_sgg where sgg_nm = '종로구';
-- buffer 경계에서 100미터 밖
select st_area(st_buffer(geom, 100)) from admin_sgg where sgg_nm = '종로구';
create table temp as select geom from admin_sgg where sgg_nm = '종로구';

select e.*
from (select sgg_cd from admin_sgg where sgg_nm = '종로구') s
inner join admin_emd e on s.sgg_cd = substr(e.emd_cd, 1, 5);

select e.*
from (select geom as geom from admin_sgg where sgg_nm = '종로구') s
inner join admin_emd e 
-- on st_contains(s.geom, e.geom)
on st_intersects(s.geom, e.geom);

select e.*
from (select st_buffer(geom, 1) as geom from admin_sgg where sgg_nm = '종로구' )s 
inner join admin_emd e on st_contains(s.geom, e.geom);

drop table temp2;


-- 경찰서가 가장 많이 있는 구 찾기
create table temp as
select s.sgg_nm, count(1), s.geom as gu, p.geom as po from admin_sgg s
inner join policestation p on st_contains(s.geom, p.geom)
group by s.sgg_nm, gu, po
order by count desc;

-- 신도림역 1km 반경 내에 있는 가게 목록
create table temp1 as
select distinct(st.*)
from stores st
inner join subway_station ss on st_dwithin(ss.geom, st.geom, 1000)
where ss.nam2 = '신도림역';

-- 소방서의 관할구역을 주변 3km라고 정했을 때, 관할구역 내의 상점이 가장 많은 소방서는?
select f.nam, count(st.nam) as cnt
from stores st
inner join firestation f on st_contains(st_buffer(f.geom, 3000), st.geom)
group by f.nam
order by cnt desc;

-- 한강(river_cd = 1) 전체(union)의 중점(centroid)에서 가장 가까운 보건소는?
select h.nam, st_distance(h.geom, r.geom) distance 
from healthcenter h, (select st_centroid(st_union(geom)) geom from river where river_cd = '1') r
order by distance asc



