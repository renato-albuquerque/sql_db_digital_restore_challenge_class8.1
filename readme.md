# Projeto de Banco de Dados - SQL/PostgreSQL

Desenvolvimento de Projeto de Banco de Dados com SQL/PostgreSQL. `Desafios Aula 8.1, Questões 01-05, Módulo 01 (SQL).` 

Instituição: [Digital College Brasil](https://digitalcollege.com.br/) (Fortaleza/CE) <br>
Curso: Data Analytics (Turma 18) <br>
Instrutora: [Nayara Wakweski](https://github.com/NayaraWakewski) <br>

<br>

## Etapas de Desenvolvimento

### Enunciado das Questões:
![screenshot](/images/all_questions.png) <br>
    
<br>

## Restore do Banco de Dados
- Criar banco de dados: digital_restore (Interface gráfica). <br>
![screenshot](/images/create_database.png) <br>

- Fazer "Restore" do banco de dados (Interface gráfica). <br>
![screenshot](/images/restore.png) <br>

<br>

## Exercício 1
- Liste nome (funcionário e cargo) por departamento com salário e pretensão salarial. <br>

- Comandos SQL: <br>
```
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
```
<br>

- Visualização: <br>

![screenshot](/images/ex1.png) <br>

<br>

## Exercício 2
- Listar os funcionários (nome e salário) que não sejam PCD e que possuam salário maior que R$4.000,00 ordenados pelo maior salário. <br>

- Comandos SQL: <br>
```
select f.nome as funcionario,
		l.salario,
		f.pcd
from corporativo.lotacao l
inner join corporativo.funcionario f on l.id_funcionario = f.id
where f.pcd = false and l.salario > 4000
order by l.salario desc;
```
<br>

- Visualização: <br>

![screenshot](/images/ex2.png) <br>

<br>

## Exercício 3
- Liste os cargos e suas respectivas médias salariais maiores que R$5.000,00. <br>

- Comandos SQL: <br>
```
select c.nome as cargo, 
		avg(l.salario)::numeric(18,2) as media_salario
from corporativo.lotacao l
inner join corporativo.cargo c on l.id_cargo = c.id
group by cargo
having avg(l.salario) > 5000
order by media_salario desc;
```
<br>

- Visualização: <br>

![screenshot](/images/ex3.png) <br>

<br>

## Exercício 4
- Qual o total de registros, a soma, média, máximo e mínimos salários por cargo (nome)? <br>

- Comandos SQL: <br>
```
select c.nome as cargo, 
		count(c.nome) as total_registros,
		sum(l.salario) as total_salarios,
		avg(l.salario)::numeric(18,2) as media_salario,
		max(l.salario) as maior_salario,
		min(l.salario) as menor_salario
from corporativo.lotacao l
inner join corporativo.cargo c on l.id_cargo = c.id
group by c.nome;
```
<br>

- Visualização: <br>

![screenshot](/images/ex4.png) <br>

<br>

## Exercício 5
- Qual o total de registros, a soma, média, máximo e mínimos salários por cargo (nome), dos funcionários que não são PCD e estão ativos? <br>

- Comandos SQL: <br>
```
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
```
<br>

- Visualização: <br>

![screenshot](/images/ex5.png) <br>

<br>

## Meus Contatos

- Business Card - [Renato Albuquerque](https://rma-contacts.vercel.app/)
- Linkedin - [renato-malbuquerque](https://www.linkedin.com/in/renato-malbuquerque/)
- Discord - [Renato Albuquerque#0025](https://discordapp.com/users/992621595547938837)