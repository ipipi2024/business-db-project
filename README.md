# Database Installation Guide
Follow these steps to set up the business database on your local MySQL server.
## Prerequisites ##
- Latest version of MySQL Workbench
- Latest version of MySQL Server
## Initial Setup ##
1.  Launch MySQL Server and establish a connection using MySQL Workbench.
2.  Navigate to the ```cleaned``` folder by following the path: ```business-db-project/data/cleaned```.
3.  Copy the file ```CompanyData_cleaned.csv``` and place it in your secure uploads folder.
    - **Windows (default):** ```C:/ProgramData/MySQL/MySQL Server 8.0/Uploads```
    - **Mac/Linux:** Run ```Show VARIABLES LIKE 'secure_file_priv'``` in MySQL to find the path.

## Running the SQL Scripts ##
### Default Method ###
1.  Back in MySQL Workbench, look to the top left and follow the path *File* > *Run SQL Script*.
2.  In the *Run SQL Script* pop-up, navigate to ```phase1_load.sql``` in following the path: ```business-db-project/sql/phase1```.
3.  Select ```phase1_load.sql``` and click *Open*, and in the next pop-up select *Run*.
4. Repeat steps 1-3 for each script in its respective ```sql/phase#/``` folder.

**Note:** Phase 2 contains the ER diagram and does not require script execution.

### Workaround ###
If you encounter this error while running an SQL script:  
  
>**"[WinError 32] The process cannot access the file because it is being used by another process."**

You will need to use this workaround:
1. In MySQL Workbench, look to the top left and follow the path *File* > *Open SQL Script*.
2. In the *Open SQL Script* pop-up, navigate to ```phase1_load.sql``` in following the path: ```business-db-project/sql/phase1```.  
3. Click the lightning bolt icon⚡in the toolbar.
4. Repeat steps 1-3 for each script in its respective ```sql/phase#/``` folder.

## Results ##
After all SQL scripts have been run, look at the attached documentation and follow the steps in phase 7 to export the database.
