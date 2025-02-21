DECLARE
    v_Sid StudXXX.Sid%TYPE := '&Enter_Student_ID';
    v_Sname StudXXX.Sname%TYPE;
    v_Class StudXXX.Class%TYPE;
    v_Pid StudXXX.Pid%TYPE;
    v_Pname Project.Pname%TYPE;
BEGIN
    SELECT Sname, Class, Pid INTO v_Sname, v_Class, v_Pid
    FROM StudXXX
    WHERE Sid = v_Sid;

    SELECT Pname INTO v_Pname
    FROM Project
    WHERE Pid = v_Pid;

    DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_Sid);
    DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_Sname);
    DBMS_OUTPUT.PUT_LINE('Class: ' || v_Class);
    DBMS_OUTPUT.PUT_LINE('Project ID: ' || v_Pid);
    DBMS_OUTPUT.PUT_LINE('Project Name: ' || v_Pname);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No student found with ID ' || v_Sid);
END;
/
