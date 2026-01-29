       IDENTIFICATION DIVISION.
       PROGRAM-ID. MOVE-EMPLOYEE-DATA.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT EMPLOYEE-FILE ASSIGN TO 'EMPLOYEE.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  EMPLOYEE-FILE.
       01  EMPLOYEE-RECORD.
           05  EMP-ID       PIC X(10).
           05  EMP-NAME     PIC X(30).
           05  EMP-DEPT     PIC X(20).

       WORKING-STORAGE SECTION.
       01  EMPLOYEE-ARRAY.
           05  EMPLOYEE-DATA OCCURS 10 TIMES.
               10  EMP-ID-ARRAY       PIC X(10).
               10  EMP-NAME-ARRAY     PIC X(30).
               10  EMP-DEPT-ARRAY     PIC X(20).
       01  INDEX-VAR       PIC 9(2) VALUE 1.
       01  ARRAY-LIMIT     PIC 9(2) VALUE 10.

       PROCEDURE DIVISION.
       MAIN-PARA.
           OPEN OUTPUT EMPLOYEE-FILE
           PERFORM VARYING INDEX-VAR FROM 1 BY 1 UNTIL INDEX-VAR > ARRAY-LIMIT
               MOVE EMP-ID-ARRAY(INDEX-VAR) TO EMP-ID
               MOVE EMP-NAME-ARRAY(INDEX-VAR) TO EMP-NAME
               MOVE EMP-DEPT-ARRAY(INDEX-VAR) TO EMP-DEPT
               WRITE EMPLOYEE-RECORD
           END-PERFORM
           CLOSE EMPLOYEE-FILE
           DISPLAY 'Employee data has been moved to the file.'
           STOP RUN.