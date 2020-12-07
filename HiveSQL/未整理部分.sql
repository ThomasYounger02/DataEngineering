----------------------------------------------------------------------------------------
--特殊关键字
----------------------------------------------------------------------------------------
select

from
    
where
    1=1
    and dt = current_date                   --系统日期




----------------------------------------------------------------------------------------
--&
----------------------------------------------------------------------------------------





----------------------------------------------------------------------------------------
-- 辅助表构建
----------------------------------------------------------------------------------------
-- 数据扩展辅助
-- linkage: 1
-- extend: range(0, 31)
select
	linkage
	,extend
from
    asist_table
where
    1=1
    and extend between 1 and 10






----------------------------------------------------------------------------------------
-- with 函数用法
----------------------------------------------------------------------------------------
with base_data as (
select

from
    table
where
    1=1
    and 
),
base_data_control as (
select 
    *
from 
    base_data
where 
    1=1
    and
)

select 

from
    base_data a
    
    left join 
    base_data_control b
    on a.useless = b.useless
order by



----------------------------------------------------------------------------------------
-- 最小样本量计算
----------------------------------------------------------------------------------------
select
    canvascanvas
    ,count(distinct t0.ppppp) as samples
    ,round(avg(coalesce(ggggg, 0)), 2) as avg_ggggg
    ,round(var_pop(coalesce(ggggg, 0)), 2) as var_ggggg
    ,ceil(var_pop(coalesce(ggggg, 0)) * 15.69 / pow(avg(coalesce(ggggg, 0)) * 0.02, 2)) as sample_size_m_2
    ,ceil(var_pop(coalesce(ggggg, 0)) * 15.69 / pow(avg(coalesce(ggggg, 0)) * 0.02, 2) * 3 / count(t1.ppppp) * 7) as exp_duartion_m_2
    ,ceil(var_pop(coalesce(ggggg, 0)) * 15.69 / pow(avg(coalesce(ggggg, 0)) * 0.03, 2)) as sample_size_m_3
    ,ceil(var_pop(coalesce(ggggg, 0)) * 15.69 / pow(avg(coalesce(ggggg, 0)) * 0.03, 2) * 3 / count(t1.ppppp) * 7) as exp_duartion_m_3
from
    (
    select
        canvascanvas,
        ppppp
    from
        table
    where
        1 = 1
        and concat_ws('-','year','month','day') between '' and ''
        and canvascanvas in ()
    ) t0

    left join 
    (
    select
        ppppp
        ,ggggg
        ,ccccc
    from
        table
    where
        1 = 1
        and dt between '' and ''
    group by
        ppppp
    ) t1 
    on 
group by
    canvascanvas
    