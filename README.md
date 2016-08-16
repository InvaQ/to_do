Heroku: https://garage-todo.herokuapp.com/
SQL task
..................................................................................

Given tables:
★ tasks (id, name, status, project_id)
★ projects (id, name)


1. get all statuses, not repeating, alphabetically ordered
1. SELECT DISTINCT status FROM TASKS ORDER BY status;
___________________________________________________________________________________
2. get the count of all tasks in each project, order by tasks count descending
2. SELECT projects.id, COUNT(tasks) AS amount FROM tasks RIGHT JOIN projects
    ON tasks.project_id = projects.id GROUP BY projects.id
    ORDER BY task_count DESC
___________________________________________________________________________________
3. get the count of all tasks in each project, order by projects names
3. SELECT projects.name, COUNT(*) AS amount FROM tasks INNER JOIN projects 
    GROUP BY projects.name  ORDER BY projects.name
___________________________________________________________________________________
4. get the tasks for all projects having the name beginning with “N” lette
4. SELECT * FROM tasks INNER JOIN projects ON (tasks.project_id = projects.id) 
WHERE projects.name LIKE 'N%';
___________________________________________________________________________________
5. get the list of all projects containing the ‘a’ letter in the middle of the name, and
show the tasks count near each project. Mention that there can exist projects without
tasks and tasks with project_id=NULL
5. SELECT projects.name, COUNT(tasks.id) AS amount FROM projects RIGHT JOIN tasks 
    ON projects.id = tasks.project_id WHERE projects.name LIKE '_%a%_' 
    GROUP BY projects.name
___________________________________________________________________________________
6. get the list of tasks with duplicate names. Order alphabetically
6. SELECT name, COUNT(*) FROM tasks GROUP BY name HAVING COUNT(*) > 1 ;
___________________________________________________________________________________
7. get the list of tasks having several exact matches of both name and status, from
the project ‘Garage’. Order by matches count
7. SELECT tasks.name FROM tasks RIGHT JOIN projects ON tasks.projects_id = projects.id
    WHERE projects.name = 'Garage' GROUP BY tasks.name, tasks.status
    HAVING COUNT(tasks) >1 ORDER BY COUNT(tasks) ;
___________________________________________________________________________________
8. get the list of project names having more than 10 tasks in status ‘completed’. Orderby project_id
8. SELECT projects.name, COUNT(tasks.id) as count FROM projects 
    RIGHT JOIN tasks ON projects.id = tasks.project_id 
    WHERE tasks.status = 'completed' 
    GROUP BY projects.name HAVING count > 10 ORDER BY projects.id;
Ivan Kudlatov
