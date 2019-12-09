drop table if exists cleaned.artists cascade;

create table cleaned.artists as (
select
	"BeginDate" as birth_date, 
	"EndDate" as death_date
	from raw.artists
);

comment on table cleaned.artists is 'TAbla raw.artists limpia';

