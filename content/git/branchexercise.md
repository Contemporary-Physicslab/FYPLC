(ch_branch_exercise)=
# branch exercise

> Here we present an exercise to get you acquainted with the branching workflow of gidhub.

but first what is a branch and why do we use them?
A branch is a separate version of your files, which can be changed without changing the original. This is very useful when you want to try something in different ways but are not yet sure which way is the best, or when you are working together with other people in the same repository at the same time. 
Often after using different branches, you want to combine these branches again. This is called merging branches. This can be very easy when the branches have no parts which are different between the two branches. For example when you have a branch 1 with file A, and a branch 2 with file A and file B. However, sometimes you have changed things in one of the branches and they have conflicting parts, for example when branch 1 has a file A version 1, and  branch 2 has a file A version 2. Now you have a merge conflict. This can then be resolved by picking which parts of each branch you want to keep, and which parts you want to discard.


1. go to your repository and navigate to the branch menu and create a new branch. this can be found under code.

2. for the branch name you should use a name that describes what it is for. such as "practicum_week1" check that the source is set to the branch from which you want to create your new branch (in this case 'main').

now that you have a branch you need to select it as your working branch in VSC. 

3. open VSC and navigate to your repository. open the Source Control panel on the left (Ctrl + shift + g) where your repository should listed under "Repositories"

hier staat links van de drie puntjes de branch waarin je huidig aan het werken bent. dit kan je ook links onderin je scherm vinden.

4. als je hierop clik komt er een tablad naar voren waar je de nieuwe branch kan selectreren. 

probeer nu iets aan te passen in je reposetory en dit te pushen naar gidhub. als het goed is gegaan kan je deze commit nu terug vinden op je gidhub pagina onder de niuewe branch. Die kan je vinden door op het slect menutje links van het branch menu te clicken en je nieuwe branch te selecteren. 