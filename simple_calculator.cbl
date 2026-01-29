       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIMPLE-CALCULATOR.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  NUM1           PIC 9(5)V9(2) VALUE 0.
       01  NUM2           PIC 9(5)V9(2) VALUE 0.
       01  RESULT         PIC 9(5)V9(2) VALUE 0.
       01  OPERATOR       PIC X VALUE SPACE.
       01  CONTINUE-FLAG  PIC X VALUE 'Y'.

       PROCEDURE DIVISION.
       MAIN-PARA.
           PERFORM UNTIL CONTINUE-FLAG NOT = 'Y'
               DISPLAY 'Enter first number: '
               ACCEPT NUM1
               DISPLAY 'Enter operator (+, -, *, /): '
               ACCEPT OPERATOR
               DISPLAY 'Enter second number: '
               ACCEPT NUM2
               EVALUATE OPERATOR
                   WHEN '+'
                       COMPUTE RESULT = NUM1 + NUM2
                   WHEN '-'
                       COMPUTE RESULT = NUM1 - NUM2
                   WHEN '*'
                       COMPUTE RESULT = NUM1 * NUM2
                   WHEN '/'
                       IF NUM2 NOT = 0
                           COMPUTE RESULT = NUM1 / NUM2
                       ELSE
                           DISPLAY 'Error: Division by zero.'
                           CONTINUE
                       END-IF
                   WHEN OTHER
                       DISPLAY 'Invalid operator.'
                       CONTINUE
               END-EVALUATE
               DISPLAY 'Result: ' RESULT
               DISPLAY 'Do you want to continue? (Y/N): '
               ACCEPT CONTINUE-FLAG
           END-PERFORM.
           STOP RUN.