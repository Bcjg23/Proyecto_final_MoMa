create or replace function imput_date
(
	bad_date date
)
returns date
language sql
as $$
select
	case when bad_date is null then '2019-01-01'::date
	else bad_date end as date_fixed;
$$;

create or replace function gen_oc
(
	cons text
)
returns text
language sql
as $$
select
	case when cons ilike ',' then 'si'
	else 'no' end as n_cons;
$$;

drop table if exists semantic.entities cascade;

create table semantic.entities as (
select
	artist, 
	case when death_date is null then 'alive' else 'dead' end as state,
	daterange(birth_date, imput_date(death_date)) as from_to
	from cleaned.artists
	where  birth_date is not null and (death_date is not null or birth_date > '1950-01-01'::date)
);

drop table if exists semantic.events cascade;

create table semantic.events as (
select
	gen_oc(constituent) as obra_compartida,
	trim(unnest(string_to_array(constituent, ','))) as constituent,
	artwork as event, 
	classification as type_event,
	date
	from cleaned.artworks
);

comment on table semantic.events is 'Tabla de eventos de las entidades';
