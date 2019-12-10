drop table if exists cleaned.artists cascade;

create or replace function fix_date
(
	bad_date text
)
returns date
language sql
as $$
select
	case when bad_date = '0'then null
	else to_date(bad_date,'YYYY')end as date_fixed;
$$;


create table cleaned.artists as (
select
	"ConstituentID" as constituent, 
	lower("DisplayName") as artist, 
	lower("ArtistBio") as artist_bio, 
	lower("Nationality") as nationality, 
	lower("Gender") as gender,
	fix_date("BeginDate") as birth_date,	
	fix_date("EndDate")  as death_date,
	lower("Wiki QID") as wiki_qid,
	"ULAN" as ulan
	from raw.artists
);

comment on table cleaned.artists is 'Tabla raw.artists limpia';

create table cleaned.artworks as (
select
	"Title" as artwork, 
	lower("Artist") as artist, 
	"ConstituentID" as constituent, 
	lower("ArtistBio") as artist_bio, 
	lower("Nationality") as nationality, 
	"BeginDate" as birth_date, 
	"EndDate" as end_date, 
	"Date" as date, 
	lower("Medium") as medium, 
	"Dimensions" as dimensions, 
	lower("CreditLine") as credit_line, 
	"AccessionNumber" as accession_number, 
	lower("Classification") as classification, 
	lower("Department") as department, 
	"DateAcquired" as date_acquired, 
	lower("Cataloged") as cataloged, 
	"ObjectID" as object, 
	lower("URL") as url, 
	lower("ThumbnailURL") as thumbnail_url, 
	"Depth (cm)" as depth_cm, 
	"Diameter (cm)" as diamter_cm, 
	"Height (cm)" as height_cm, 
	"Length (cm)" as length_cm, 
	"Weight (kg)" as weight_kg, 
	"Width (cm)" as width_cm, 
	"Seat Height (cm)" as seat_height_cm, 
	"Duration (sec.)" as duration_sec
	from raw.artworks
);

comment on table cleaned.artworks is 'Tabla raw.artworks limpia';
