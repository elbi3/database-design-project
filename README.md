# Database Design for Vintage Patterns and their Corrections

Purpose: Store patterns and modifications for use in an app

## Abstract
Many modern reprints of vintage patterns are not faithful reproductions. Sewists are discovering the descrepancies between the old and new patterns through trial and error. Since the originals are usually not available, the only recourse a sewist has is to look for another's corrections, or to correct the reproduction themselves. This database concept attempts to link new corrections with reprinted patterns. It provides a mechanism for users to upvote content so that the good reproductions rise to the top, and the good corrections rise to the top.

The EER is designed around Users, their submissions (of content and comments), and their relationship with both the content they add and that content in reference to pre-existing sewing patterns. The most important data exists in the table relationships happening between the User tables and the Pattern tables. Without the connecting categories (comments, submissions), there would be no point for storing User or Pattern data. 

## ERD
<img width="654" height="591" alt="erd_08_19_2025" src="https://github.com/user-attachments/assets/867875cd-a0a4-4327-9e44-1df2e4b4b452" />

## Technologies Used 
![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=vscode&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4169E1.svg?style=for-the-badge&logo=visual-studio-code&logoColor=orange)

## How to Run Scripts
