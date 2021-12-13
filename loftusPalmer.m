clear
close all

%% Experiment 1
% table 1
exp1=readtable('experiment1.xlsx');                                 %reads in experiment 1 data
verb=findgroups(exp1.verbs);                                        %finds groups based on the different verbs
[gSG id1]=findgroups(exp1.verbs);                                   %returns the group numbers created
means=splitapply(@mean,exp1.estimates,verb);                        %calculates the means for each group
rounded=round(means,1);                                             %rounds all of the means to 1 decimal point
table1=table(id1,rounded);                                          %creates a table of verb and means
table1.Properties.VariableNames={'Verb' 'Mean speed estimate'};     %renames the variables 
table1=sortrows(table1,2,'descend')                                 %make it so table 1 shows rows in descending mean order 

% extra credit table 1
VerbC=categorical(string(id1));                                             %convert the verbs to categorical
ToStr=string(rounded);                                                      %convert the rounded means to strings
ToStr(4)=strcat(ToStr(4),".0");                                             %concatenates .0 to the string
table1pretty=table(VerbC,categorical(ToStr));                               %creates table of the verb and means 
table1pretty.Properties.VariableNames={'Verb' 'Mean speed estimate'};       %renames the variables
table1pretty=sortrows(table1pretty,2,'descend')                             %sorts the rows of table1pretty in descending mean order

% graph of results in table 1
n=splitapply(@length,exp1.estimates,verb);              %find the how many participants are in each verb category
ses=splitapply(@std,exp1.estimates,verb)/sqrt(n(1));    %finds standard error for each mean
ses=[ses(5); ses(2); ses(1); ses(4); ses(3)];           %reorders the standard errors to match the descending mean order on graph

X=categorical(table1.Verb);                                                 %convert to categorical
X=reordercats(X,table1.Verb);                                               %reorder the categories like they were on table1
Y=table1.('Mean speed estimate');                                           %stores the means in Y
bar(X,Y)                                                                    %plots X by Y on a bar graph
xlabel('Verb')                                                              %labels the x-axis
ylabel('Mean speed estimate')                                               %labels the y-axis
title(['SPEED ESTIMATES FOR THE VERBS',newline,'USED IN EXPERIMENT I'])     %adds a title to the graph
hold on                                                                     %to add more stuff to the graph
errorbar(X,Y,ses,'k+')                                                      %adds the errors bars 

%% Experiment 2
% table 2
exp2=readtable('experiment2.xlsx');                 %reads in experiment 2 data
ToF=findgroups(exp2.response,exp2.verb);            %creates groups based on different combinations of response and verb
[g id id2]=findgroups(exp2.response,exp2.verb);     %returns the group numbers created for each combination
values=splitapply(@numel,exp2.response,ToF);        %finds how many values are in each group
F={'No','Yes'};                                     %an array of no and yes
response=(F(1+id))';                                %converts the 'true' and 'false' values to be 'yes' and 'no', respectively
Smashed=[values(6); values(3)];                     %an array of smashed responses
Hit=[values(5); values(2)];                         %an array of hit responses
Control=[values(4); values(1)];                     %an array of control reponses
Response=[response(4); response(1)];                %an array of the two possible responses
table2=table(Response,Smashed,Hit,Control)          %creates a table of the response with smashed, hit, and control values

% extra credit table 2
ResC=categorical(Response);                                     %convert to categorical
tab1=table(ResC);                                               %create table of responses
tab1.Properties.VariableNames={'Response'};                     %renames variables
tab2=table(Smashed,Hit,Control);                                %create table of smashed, hit, and control
table2pretty=table(tab1,tab2);                                  %creates a table of tab1 and tab2 nested inside
table2pretty.Properties.VariableNames={' ' 'Verb Condition'}    %renames variables

% table 3
N=length(exp2.estimate);                                    %find how many participants total
%set all counting variables to 0 before counting 
n=0; m=0; n2=0; m2=0; n3=0; m3=0; n4=0; m4=0;
c=0; d=0; c2=0; d2=0; c3=0; d3=0; c4=0; d4=0;
%for loop to go through all values 
for i=1:N
    %if statement to determine which category the estimate falls, which is either 1-5, 6-10, 11-15, or 16-20
    if exp2.estimate(i)>=16
        %if statement to determine if the verb they got was smashed or hit
        if isequal(exp2.verb(i),cellstr('smashed'))
            n=n+1;                                      %counts people who got the verb smashed 
            %if statement to determine if their response was "yes"
            if exp2.response(i)==1
                c=c+1;                                  %counts how many responded yes to the question
            end
        elseif isequal(exp2.verb(i),cellstr('hit'))
            m=m+1;                                      %counts people who got the verb hit
            %if statement to determine if their response was "yes"
            if exp2.response(i)==1
                d=d+1;                                  %counts how many responded yes to the question
            end
        end
    elseif exp2.estimate(i)>=11
        %if statement to determine if the verb they got was smashed or hit
        if isequal(exp2.verb(i),cellstr('smashed'))
            n2=n2+1;                                    %counts people who got the verb smashed 
            %if statement to determine if their response was "yes"
            if exp2.response(i)==1
                c2=c2+1;                                %counts how many responded yes to the question
            end
        elseif isequal(exp2.verb(i),cellstr('hit'))
            m2=m2+1;                                    %counts people who got the verb hit
            %if statement to determine if their response was "yes"
            if exp2.response(i)==1
                d2=d2+1;                                %counts how many responded yes to the question
            end
        end
    elseif exp2.estimate(i)>=6
        %if statement to determine if the verb they got was smashed or hit
        if isequal(exp2.verb(i),cellstr('smashed'))
            n3=n3+1;                                    %counts people who got the verb smashed 
            %if statement to determine if their response was "yes"
            if exp2.response(i)==1
                c3=c3+1;                                %counts how many responded yes to the question
            end
        elseif isequal(exp2.verb(i),cellstr('hit'))
            m3=m3+1;                                    %counts people who got the verb hit
            %if statement to determine if their response was "yes"
            if exp2.response(i)==1
                d3=d3+1;                                %counts how many responded yes to the question
            end
        end
    elseif exp2.estimate(i)>=1
        %if statement to determine if the verb they got was smashed or hit
        if isequal(exp2.verb(i),cellstr('smashed'))
            n4=n4+1;                                    %counts people who got the verb smashed 
            %if statement to determine if their response was "yes"
            if exp2.response(i)==1
                c4=c4+1;                                %counts how many responded yes to the question
            end
        elseif isequal(exp2.verb(i),cellstr('hit'))
            m4=m4+1;                                    %counts people who got the verb hit
            %if statement to determine if their response was "yes"
            if exp2.response(i)==1
                d4=d4+1;                                %counts how many responded yes to the question
            end
        end
    end
end
Verb={'Smashed'; 'Hit'};                                                            %an array of the 2 possible verbs
OtF=[c4/n4; round(d4/m4,2)];                                                        %an array of the proportions for people who estimated between 1-5 mph
StT=[c3/n3; round(d3/m3,2)];                                                        %an array of the proportions for people who estimated between 6-10 mph
EtF=[round(c2/n2,2); round(d2/m2,2)];                                               %an array of the proportions for people who estimated between 11-15 mph
Stt=[c/n; d/m];                                                                     %an array of the proportions for people who estimated between 16-20 mph
table3=table(Verb,OtF,StT,EtF,Stt);                                                 %creates a table of the verbs with all the proportions of responses for each verb and speed estimate
table3.Properties.VariableNames={'Verb condition' '1-5' '6-10' '11-15' '16-20'}     %renames the variables

% extra credit table 3
VC=categorical(Verb);                                               %converts to categorical
SttS=string(Stt);                                                   %converts to string
SttS(1)=strcat(SttS(1),"0");                                        %concatenates a 0 to the string
SttS(2)=strcat(SttS(2),"0");                                        %concatenates a 0 to the string
OtFS=string(OtF);                                                   %converts to string
OtFS(1)=strcat(OtFS(1),"0");                                        %concatenates a 0 to the string
ta1=table(VC);                                                      %creates a table of the verbs
ta1.Properties.VariableNames={'Verb condition'};                    %renames the variable
ta2=table(categorical(OtFS),StT,EtF,categorical(SttS));             %creates a table of the proportions
ta2.Properties.VariableNames={'1-5' '6-10' '11-15' '16-20'};        %renames the variables
table3pretty=table(ta1,ta2);                                        %creates table3pretty, which has ta1 and ta2 nested inside 
table3pretty.Properties.VariableNames={' ' 'Speed estimate (mph)'}  %renames the variables