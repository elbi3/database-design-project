# Database Design for Vintage Patterns and their Corrections

Purpose: Store patterns and user-created modifications for use in an app

## Abstract
Many modern reprints of vintage patterns are not faithful reproductions. Sewists are discovering the descrepancies between the old and new patterns through trial and error. Since the originals are often available, the only recourse a sewist has is to look for another's corrections, or to correct the reproduction themselves. This database concept attempts to link new corrections with reprinted patterns. It provides a mechanism for users to upvote content so that the good reprints get the most attention and needed corrections are put "on top of the pile".

The EER is designed around Users, the content the bring to the app (comments, pattern re-drafts), and their relationship with that content in reference to pre-existing sewing patterns (copy-wrighted material). The most important data exists in the table relationships happening between the User tables and the Pattern tables. Without the connecting categories (comments, submissions), there would be no point for storing User or Pattern data. 

## Technologies Used 
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=vscode&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4169E1.svg?style=for-the-badge&logo=visual-studio-code&logoColor=orange)
![Git](https://img.shields.io/badge/Git-2E0305?style=for-the-badge&logo=git&logoColor=FF3E00)
![GitHub](https://img.shields.io/badge/GitHub-22043C?style=for-the-badge&logo=github&logoColor=FF3E00)

## How to Run SQL Scripts
This database is still in its design phase. Scripts have been developed on my machine in MySQLWorkbench. Later iterations of the project to build the database are still in the works.

### On your machine:
1. Navigate to the green Code button on the repository, and clone it by copying the [SSH](git@github.com:elbi3/SewingPatternApp-DB.git).
2. Clone it with terminal command:
   ```sh
   git clone https://github.com/elbi3/SewingPatternAP-DB
   ```
3. Open files in IDE of choice.
   
- Alternatively, select "Open with Github Desktop" to view files in Github Desktop.
  
## With MySQL Workbench:
1. Open MySQL Workbench and establish a connection to your desired MySQL server instance.
2. To open an SQL file, navigate to the "file" menu and select "Open SQL Script..."
3. Locate and open the file of choice from the popup, and selected SQL file will load into a new query editor tab.
4. Click the lightning bolt icon in the toolbar to execute all statements within the opened file.

## ERD
<img width="654" height="591" alt="erd_08_19_2025" src="https://github.com/user-attachments/assets/867875cd-a0a4-4327-9e44-1df2e4b4b452" /> 


![relationship_ref](https://github.com/user-attachments/assets/a954a41f-f7c0-4694-90ef-0464e6f2758d)

