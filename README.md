# simple-forth-expert
A simple yes/no expert system written in Forth. Originally designed to determine which variant of covid-19 a person might have. Tested on ForthWin.
https://github.com/PeterForth/ForthWin-Download

The database is a fictional example to illustrate how the simple expert system can be used. Please do not use this database for medical diagnosis. Consult your
doctor if you are feeling unwell.

You are free to use this project as you wish but please give credit and share any bugs or improvements made to the main algorithm. 

## Usage

After loading the expert system language and database into your Forth implementation, type "solve" to start the diagnosis. The system will ask a number of yes/no questions.
Respond yes by typing "y" and no by typing "n". The system will attempt to find the correct diagnosis based on the symptoms. 

To update the database, declare whatever questions are necessary in the format ```question: <question>``` the question must not contain any spaces. Rules can then be constructed
containing the questions. 

        rule: <rule>
          <question1> ,
          <question2> ,
          <question3> ,
          ...
          <questionN>
        ;rule

For the rule to match and be the result of the program, every question associated with it must be a "yes". Questions will only be asked once for each run of the expert system.
  
