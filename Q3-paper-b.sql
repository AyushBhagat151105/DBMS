DECLARE
    CURSOR project_cursor IS
        SELECT p.Pid, p.Pname, s.Sname, p.Pend_dt - p.Pstart_dt AS Duration
        FROM Project p
        JOIN StudXXX s ON p.Pid = s.Pid;

    v_Pid Project.Pid%TYPE;
    v_Pname Project.Pname%TYPE;
    v_Sname StudXXX.Sname%TYPE;
    v_Duration NUMBER;
    total_duration NUMBER := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Project ID | Project Name               | Student Name      | Duration');
    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------');

    FOR rec IN project_cursor LOOP
        DBMS_OUTPUT.PUT_LINE(rec.Pid || ' | ' || RPAD(rec.Pname, 30) || ' | ' || RPAD(rec.Sname, 20) || ' | ' || rec.Duration);
        total_duration := total_duration + rec.Duration;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Duration: ' || total_duration);
END;
/
