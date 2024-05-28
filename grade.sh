CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

#Step 2:
if [[ -f student-submission/ListExamples.java ]]
then
    echo "File Found"
else
    echo "ListExamples.java not found"
    echo "Grade: 0"
    exit
fi

#Step 3:
cp TestListExamples.java student-submission/ListExamples.java grading-area
cp -r lib grading-area

#Step 4:
cd grading-area
javac -cp $CPATH *.java

echo "The exit code for compiler is: $?."
if [[ $? == 0 ]]
then
    echo ""
else
    exit
fi

#Step 5:
java -cp ".:lib/*" org.junit.runner.JUnitCore TestListExamples > output.txt

if [[ $? == 0 ]]
then 
echo "Recieved Full Credit. 3/3 Points"
else
echo "Error Occured, Didn't Recieve Full Credit."
returnVal=$( tail -n 2 output.txt )
echo $returnVal
fi

