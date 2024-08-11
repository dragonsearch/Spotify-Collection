# Spotify Collection & Analysis SQL

## Description

This is a small project of mine to re-sharpen and learn a bit more about SQL, in particular MYSQL. No "toy/tutorial" project interested me in particular so I decided to make my own.

## Can it be useful to you?

As a learning tool, I do think the questions here and just the data cleaning -> input to DB is a decent practical exercise to begin with.

In theory, this project also aims to contain a bit of practising using Unit Testing too, and obviously some data analysis performed on the db, comparing different answers efficiencies.

# What's the data used? Where do I get it from?

This is **not** a "toy" dataset for SQL. It is an aggregation of several datasets with different formatting from kaggle:

- [Spotify Million Song Dataset](https://www.kaggle.com/datasets/notshrirang/spotify-million-song-dataset/data)
- [Spotify 1.2M+ Songs](https://www.kaggle.com/datasets/rodolfofigueroa/spotify-12m-songs)
- [30000 Spotify Songs](https://www.kaggle.com/datasets/joebeachcapital/30000-spotify-songs?select=spotify_songs.csv)

Put them under a `data/` folder on the first level of the repo.

If you are using this as an exercise, be sure to **check** the initial structure of the data you are about to download, ie: unique values, null, some previsualization, etc, as kaggle already provides that.

# How do I get started?

#### There will be more detailed info about the specific decisions further below this section.

1. To install the specific version of MYSQL (0.8.32-1_all) just run the install-MySql-apt.sh on APT-linux (or wsl/VM).
    - For other platforms and more information, please check the official docs: https://dev.mysql.com/doc/mysql-getting-started/en/
2. Create or install the specific packages listed on the yaml using conda: `conda env create -f env.yaml`
3. **READ** and **RUN** the merge_datasets.ipynb file. 
    - Contains information about the data, the "cleaning" and some of the reestructuring that has been done. 
    - Your `data/` folder will change slighty afterwards, original data unaffected.
4. **READ** the `sql_loading_table/` folder scripts one by one.
    - Loads the CSV files into structured tables. 
    - You must have understanding of the data changed and files created from the previous step.
5. **RUN** sudo ./load_tables.sh
6. **CHECK** The tables resulting format using the notebook: tables.ipynb

Now you have the MYSQL server up & running, the conda installation ready and the files properly loaded into the DB with some relations between them already established.

# Specific decisions (FAQ)

I see you are interested on the **why** and not the what or the how:

## Why are you using characters like `¬` as delimiters?

1. This is a constrained project. The data is not going to change.
2. I want not to focus on just loading data. 
3. Time is also a resource. I could build up a decently good CSV to MYSQL loader for all kind of files. It is not the point of the project but also a good idea to implement when dealing with lots of CSV files. In this case it is just 3. and will only be 3.
4. I checked beforehand no data contains those characters in their specific files. As MYSQL supports using them as separators it works nicely.
5. Even though MYSQL can load data with strings of more than 1 character as separators, Pandas really hates them. The alternative is using numpy: `np.savetxt` to save the CSV's.

## Why are you changing some of the columns names?

- Even though this is an SQL-practice, I want to save myself some trouble renaming using MYSQL and clutter all the repo with SQL files. I do think this can be quite trivial to do but a bit bothersome than anything else. If you want to practice that specific part, ignore the cleaning performed and load the data files yourself as-is and then perform the cleaning for practice. 
- Renaming some columns to make them follow the same structure is also part of the above.

## Why did you split the tracks table into a different table for: `track_artists` and `track_artist_ids`?

- It is generally not the best practice to put an "array-like" in the values of a column, why:
    - Losing efficiency on the searches.
    - Forces the need to process that data later after the retrieval.
    - Makes using the SQL relational aspect pointless. It makes sense in a relational DB to have relations.
    This means, adding a table that correlates and uses foreign keys and primary keys properly to abstract the information quickly and efficiently.
    In this case -> One `track_id` can correspond to several `track_artists `and each of them will have an unique id: `track_artist_ids`.

## What's the key on the  `millsong` table?

It is a composite primary key (2 values to form the key). Given that there are no identifiers in that dataset and songs names can (and are) repeated. I opted for a composite primary key of song, author.

# As for the `load_tables.sh`. Why are you just not calling 4 times to those files or using another more complex approach?

It is up for improvement. If you are interested on improving that part (or any part feel free to reach me out, open an issue or whatever other method you prefer). At the moment, it is not a priority.

`cat ./sql_loading_table/*.sql | sudo mysql -u root -p --local_infile=1` This line will input all the files to MYSQL in alphabetical order (that's why tracks_**Z**artists.sql) is named like that. Right now, it is enough to handle the small number of files.

# Where is the data analysis? 

`TODO`