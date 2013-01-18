README - lab1

This lab contains some map reduce jobs to process tweets.

[[ Test Data ]]
tweet-data is in data  dir.
to genereate more data use the ruby script : gen-twitter-data.rb  

[[ Getting data into HDFS ]]
From terminal
    $ hadoop dfs -mkdir  tweets
    $ hadoop dfs -mkdir tweets/in
    
    $ cd to logs_dir
    $ hadoop dfs -put *.log   tweets/in
    

[[ Source ]]
source code is in src/ dir.  You can use any text editor / IDE to inspect the code

[[ Running MR ]]
use ./compile.sh  to compiles the files.  This will produce a.jar

submit a.jar to hadoop:
       $ hadoop jar a.jar mr.PopularHashtags   tweets/in  tweets/out
