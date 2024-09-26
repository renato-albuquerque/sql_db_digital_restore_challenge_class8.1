-- Todas as tabelas do banco de dados digital_restore:
select * from corporativo.cargo;
select * from corporativo.departamento;
select * from corporativo.funcionario;
select * from corporativo.lotacao;

-- Desafios
-- 01
select f.nome as funcionario, 
		c.nome as cargo, 
		d.nome as departamento,
		l.salario,
		f.pretensao_salarial
from corporativo.lotacao l
inner join corporativo.funcionario f on l.id_funcionario = f.id
inner join corporativo.cargo c on l.id_cargo = c.id
inner join corporativo.departamento d on l.id_departamento = d.id
order by l.salario desc;

-- 02
select f.nome as funcionario,
		l.salario,
		f.pcd
from corporativo.lotacao l
inner join corporativo.funcionario f on l.id_funcionario = f.id
where f.pcd = false and l.salario > 4000
order by l.salario desc;

-- 03
select c.nome as cargo, 
		avg(l.salario)::numeric(18,2) as media_salario
from corporativo.lotacao l
inner join corporativo.cargo c on l.id_cargo = c.id
group by cargo
having avg(l.salario) > 5000
order by media_salario desc;

-- 04
select c.nome as cargo, 
		count(c.nome) as total_registros,
		sum(l.salario) as total_salarios,
		avg(l.salario)::numeric(18,2) as media_salario,
		max(l.salario) as maior_salario,
		min(l.salario) as menor_salario
from corporativo.lotacao l
inner join corporativo.cargo c on l.id_cargo = c.id
group by c.nome;

-- 05
select c.nome as cargo, 
		count(c.nome) as total_registros,
		sum(l.salario) as total_salarios,
		avg(l.salario)::numeric(18,2) as media_salario,
		max(l.salario) as maior_salario,
		min(l.salario) as menor_salario
from corporativo.lotacao l
inner join corporativo.cargo c on l.id_cargo = c.id
inner join corporativo.funcionario f on l.id_funcionario = f.id
where f.pcd = false and l.ativo = true
group by c.nome;


		
	
