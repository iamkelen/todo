# SQL task

Given tables:
01. tasks (id, name, status, project_id)
02. projects (id, name)

1.Get all statuses, not repeating, alphabetically ordered
```
SELECT DISTINCT status FROM tasks ORDER BY status ASC
```
2.Get the count of all tasks in each project, order by tasks count
descending
```
SELECT project_id, COUNT(*) FROM tasks GROUP BY project_id ORDER BY COUNT(*) DESC
```
3.Get the count of all tasks in each project, order by projects
names
```
SELECT projects.name, COUNT(tasks.*)tasks FROM projects, tasks WHERE projects.projects_id = tasks.project_id GROUP BY projects.name ORDER BY projects.name
```
4.Get the tasks for all projects having the name beginning with
"N" letter
```
SELECT * FROM projects p JOIN tasks t ON t.project_id = p.id WHERE p.name LIKE 'N%' ;
```
5.Get the list of all projects containing the 'a' letter in the middle of
the name, and show the tasks count near each project. Mention
that there can exist projects without tasks and tasks with
project_id = NULL
```
SELECT p.name project_name, COUNT(t.id) tasks_count FROM projects p JOIN tasks t ON t.project_id = p.id WHERE p.name LIKE '%a%' GROUP BY p.id, p.name ORDER BY tasks_count DESC
```
6.Get the list of tasks with duplicate names. Order alphabetically
```
SELECT * FROM tasks WHERE name IN (SELECT name FROM tasks GROUP BY name HAVING COUNT(name)>1 ) ORDER BY name ASC
```
7.Get list of tasks having several exact matches of both name and
status, from the project 'Garage'. Order by matches count
```
SELECT t.name task_name, t.status task_status, COUNT(t.id) count_tasks FROM projects p JOIN tasks t ON t.project_id = p.id WHERE p.name = 'Garage' GROUP BY t.name, t.status ORDER BY count_tasks ;
```
8.Get the list of project names having more than 10 tasks in status
'completed'. Order by project_id
```
SELECT p.name project_name FROM projects p JOIN tasks t ON t.project_id = p.id WHERE t.status = completed GROUP BY p.name HAVING COUNT(t.id) > 10
```
