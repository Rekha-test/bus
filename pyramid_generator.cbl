       IDENTIFICATION DIVISION.
       PROGRAM-ID. PyramidGenerator.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  I               PIC 9(02) VALUE 0.
       01  J               PIC 9(02) VALUE 0.
       01  N               PIC 9(02) VALUE 5.
       01  SPACE           PIC X(10) VALUE SPACES.
       01  STAR            PIC X(10) VALUE ALL '*'.
       PROCEDURE DIVISION.
       DISPLAY-PYRAMID.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               MOVE SPACES(1:N-I) TO SPACE
               MOVE STAR(1:(2*I)-1) TO STAR
               DISPLAY SPACE STAR SPACE STAR
           END-PERFORM.
           STOP RUN.