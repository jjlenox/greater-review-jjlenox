CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'
cd student-submission
if [[ -f ListExamples.java ]]
then
    echo "java files found"
else
    echo "need a java file"
    exit 1
fi

javac ListExamples.java
if [ $? -ne 0 ]
then 
    echo "compile error"
    exit 1
fi


cp ../TestListExamples.java ./


javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java

java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > test.txt

grep "Failures" test.txt > fail.txt
if [ -s fail.txt ]
then
    echo "failed F---- 0/10 tu es mal oú tête"
else
    echo "passed A++++ 10/10ign"
fi