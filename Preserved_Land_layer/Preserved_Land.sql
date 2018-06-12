

1 Conservation(Fee) Federal Government
2 Conservation(Fee) State Government
3 Conservation(Fee) Local Government
4 Conservation(Fee) Private
5 Conservation(Easement)
6 Agricultural(Easement)





Select distinct d_des_tp
From spatial.usgs_pad_national_recode_for_wiki
where recode is null


Select distinct d_own_type from spatial.usgs_pad_national_recode_for_wiki

Select distinct d_des_tp, d_own_type, recode, raster from spatial.usgs_pad_national_recode_for_wiki_raster order by raster;


Drop View if Exists spatial.usgs_pad_national_recode_for_wiki_raster;

Create View spatial.usgs_pad_national_recode_for_wiki_raster
As
Select
*
,Case 
	when recode like 'Conservation (Fee)' and d_own_type like 'Federal' Then 1
	when recode like 'Conservation (Fee)' and d_own_type like 'State' Then 2
	when recode like 'Conservation (Fee)' and d_own_type like 'Local Government' Then 3
	when recode like 'Conservation (Fee)' and d_own_type in ('Private','Non-Governmental Organization') Then 4
	when recode like 'Conservation (Fee)' Then 5
	when recode like 'Easement' Then 6
	when recode like 'Agricultural Easement' Then 7
	end as raster

From spatial.usgs_pad_national_recode_for_wiki
Where recode not like 'Remove'


Drop View If Exists spatial.usgs_pad_national_recode_for_wiki;
Create View spatial.usgs_pad_national_recode_for_wiki as 
SELECT 
	id,
	d_des_tp,
	d_own_type,
	Case
when d_des_tp like 'Access Area' then 'Remove'
when d_des_tp like 'Agricultural Easement' then 'Agricultural Easement'
when d_des_tp like 'Approved or Proclamation Boundary' then 'Remove'
when d_des_tp like 'Area of Critical Environmental Concern' then 'Remove'
when d_des_tp like 'Conservation Area' then 'Conservation (Fee)'
when d_des_tp like 'Conservation Easement' then 'Easement'
when d_des_tp like 'Federal Other or Unknown' then 'Conservation (Fee)'
when d_des_tp like 'Forest Stewardship Easement' then 'Easement'
when d_des_tp like 'Historic or Cultural Area' then 'Conservation (Fee)'
when d_des_tp like 'Historic or Cultural Easement' then 'Remove'
when d_des_tp like 'Inventoried Roadless Area' then 'Conservation (Fee)'
when d_des_tp like 'Local Conservation Area' then 'Conservation (Fee)'
when d_des_tp like 'Local Historic or Cultural Area' then 'Conservation (Fee)'
when d_des_tp like 'Local Other or Unknown' then 'Conservation (Fee)'
when d_des_tp like 'Local Park' then 'Conservation (Fee)'
when d_des_tp like 'Local Recreation Area' then 'Conservation (Fee)'
when d_des_tp like 'Local Resource Management Area' then 'Conservation (Fee)'
when d_des_tp like 'Marine Protected Area' then 'Remove'
when d_des_tp like 'Military Land' then 'Remove'
when d_des_tp like 'Mitigation Land or Bank' then 'Conservation (Fee)'
when d_des_tp like 'National Forest' then 'Conservation (Fee)'
when d_des_tp like 'National Grassland' then 'Conservation (Fee)'
when d_des_tp like 'National Lakeshore or Seashore' then 'Conservation (Fee)'
when d_des_tp like 'National Monument or Landmark' then 'Conservation (Fee)'
when d_des_tp like 'National Park' then 'Conservation (Fee)'
when d_des_tp like 'National Public Lands' then 'Conservation (Fee)'
when d_des_tp like 'National Recreation Area' then 'Conservation (Fee)'
when d_des_tp like 'National Scenic or Historic Trail' then 'Remove'
when d_des_tp like 'National Scenic, Botanical or Volcanic Area' then 'Conservation (Fee)'
when d_des_tp like 'National Wildlife Refuge' then 'Conservation (Fee)'
when d_des_tp like 'Native American Land' then 'Remove'
when d_des_tp like 'Not Designated' then 'Conservation (Fee)'
when d_des_tp like 'Other Easement' then 'Easement'
when d_des_tp like 'Private Agricultural' then 'Agricultural Easement'
when d_des_tp like 'Private Conservation' then 'Conservation (Fee)'
when d_des_tp like 'Private Forest Stewardship' then 'Conservation (Fee)'
when d_des_tp like '%Private Historic or Cultural%' then 'Conservation (Fee)'
when d_des_tp like 'Private Other or Unknown' then 'Conservation (Fee)'
when d_des_tp like 'Private Ranch' then 'Conservation (Fee)'
when d_des_tp like 'Private Recreation or Education' then 'Conservation (Fee)'
when d_des_tp like 'Ranch Easement' then 'Agricultural Easement'
when d_des_tp like 'Recreation Management Area' then 'Conservation (Fee)'
when d_des_tp like 'Recreation or Education Easement' then 'Easement'
when d_des_tp like 'Research Natural Area' then 'Conservation (Fee)'
when d_des_tp like 'Research or Educational Area' then 'Conservation (Fee)'
when d_des_tp like 'Resource Management Area' then 'Conservation (Fee)'
when d_des_tp like 'Special Designation Area' then 'Conservation (Fee)'
when d_des_tp like 'State Conservation Area' then 'Conservation (Fee)'
when d_des_tp like 'State Historic or Cultural Area' then 'Conservation (Fee)'
when d_des_tp like 'State Other or Unknown' then 'Conservation (Fee)'
when d_des_tp like 'State Park' then 'Conservation (Fee)'
when d_des_tp like 'State Recreation Area' then 'Conservation (Fee)'
when d_des_tp like 'State Resource Management Area' then 'Conservation (Fee)'
when d_des_tp like 'State Wilderness' then 'Conservation (Fee)'
when d_des_tp like 'Unknown' then 'Remove'
when d_des_tp like 'Unknown Easement' then 'Easement'
when d_des_tp like 'Watershed Protection Area' then 'Remove'
when d_des_tp like 'Wild and Scenic River' then 'Remove'
when d_des_tp like 'Wilderness Area' then 'Conservation (Fee)'
when d_des_tp like 'Wilderness Study Area' then 'Conservation (Fee)'

	Else Null
	End as recode,


	
	geom
	
  FROM spatial.usgs_pad_national;


Select distinct d_des_tp FROM spatial.usgs_pad_national order by d_des_tp

Select distinct d_own_type   FROM spatial.usgs_pad_national; 