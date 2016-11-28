# Templating
## Create view file
1. create in app/Resource/views dir Admin/Team
2. create file list.html.twig

## Step 1
### Controller
Insert
```
return $this->render('Admin/Team/list.html.twig');
```

### view list.html.twig
```
<h1>list.html.twig: hello!</h1>
```
### check 
http://localhost:8000/admin/team

## Step 2
### Controller
Insert
```
return $this->render('Admin/Team/list.html.twig', array(
            'teams' => $teams,
        ));
```

### view list.html.twig
```
<h1>list.html.twig: hello!</h1>
<span>{% dump(teams) %}</span>
```
### check 
http://localhost:8000/admin/team

